<?php
class ModelUserUser extends Model {
	public function addUser($data) {

		
		# Modifcación Daniel : agg ean

		$this->db->query("INSERT INTO `" . DB_PREFIX . "user` SET username = '" . $this->db->escape($data['username']) . "', 
														user_group_id = '" . (int)$data['user_group_id'] . "',
														salt = '" . $this->db->escape($salt = token(9)) . "', 
														password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', 
														firstname = '" . $this->db->escape($data['firstname']) . "', 
														lastname = '" . $this->db->escape($data['lastname']) . "', 
														email = '" . $this->db->escape($data['email']) . "', 
														image = '" . $this->db->escape($data['image']) . "', 
														ean = '" . $this->db->escape($data['ean']) . "', 
														status = '" . (int)$data['status'] . "', 
														date_added = NOW()");
		 
		return $this->db->getLastId();
	}

	public function editUser($user_id, $data) {
		$this->db->query("UPDATE `" . DB_PREFIX . "user` SET username = '" . $this->db->escape($data['username']) . "', 
															user_group_id = '" . (int)$data['user_group_id'] . "', 
															firstname = '" . $this->db->escape($data['firstname']) . "', 
															lastname = '" . $this->db->escape($data['lastname']) . "', 
															email = '" . $this->db->escape($data['email']) . "', 
															image = '" . $this->db->escape($data['image']) . "', 
															ean = '" . $this->db->escape($data['ean']) . "', 
															status = '" . (int)$data['status'] . "' WHERE user_id = '" . (int)$user_id . "'");

		# Fin modificación Daniel : agg
		if ($data['password']) {
			$this->db->query("UPDATE `" . DB_PREFIX . "user` SET salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "' WHERE user_id = '" . (int)$user_id . "'");
		}
	}

	public function editPassword($user_id, $password) {
		$this->db->query("UPDATE `" . DB_PREFIX . "user` SET salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($password)))) . "', code = '' WHERE user_id = '" . (int)$user_id . "'");
	}

	public function editCode($email, $code) {
		$this->db->query("UPDATE `" . DB_PREFIX . "user` SET code = '" . $this->db->escape($code) . "' WHERE LCASE(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	}

	public function deleteUser($user_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "user` WHERE user_id = '" . (int)$user_id . "'");
	}

	public function getUser($user_id) {
		$query = $this->db->query("SELECT *, (SELECT ug.name FROM `" . DB_PREFIX . "user_group` ug WHERE ug.user_group_id = u.user_group_id) AS user_group FROM `" . DB_PREFIX . "user` u WHERE u.user_id = '" . (int)$user_id . "'");

		return $query->row;
	}

	public function getUserByUsername($username) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "user` WHERE username = '" . $this->db->escape($username) . "'");

		return $query->row;
	}

	public function getUserByEmail($email) {
		$query = $this->db->query("SELECT DISTINCT * FROM `" . DB_PREFIX . "user` WHERE LCASE(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row;
	}

	public function getUserByCode($code) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "user` WHERE code = '" . $this->db->escape($code) . "' AND code != ''");

		return $query->row;
	}

	public function getUsers($data = array()) {
		 
		error_reporting(E_ALL);
		ini_set('display_errors', '1');
	 
		
		$sql = "SELECT u.*,g.name as user_group FROM " . DB_PREFIX . "user u 
		INNER JOIN " . DB_PREFIX . "user_group g 
		ON u.user_group_id=g.user_group_id ";

		$sort_data = array(
			'u.username',
			'u.status',
			'u.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY u.username";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalUsers() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "user`");

		return $query->row['total'];
	}

	public function getTotalUsersByGroupId($user_group_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "user` WHERE user_group_id = '" . (int)$user_group_id . "'");

		return $query->row['total'];
	}

	public function getTotalUsersByEmail($email) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "user` WHERE LCASE(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row['total'];
	}
}