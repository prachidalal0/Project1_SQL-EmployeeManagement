-- MySQL Workbench Forward Engineering



SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';



-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema employees
-- -----------------------------------------------------



-- -----------------------------------------------------
-- Schema employees
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `employees` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `employees` ;



-- -----------------------------------------------------
-- Table `employees`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`departments` (
`dept_no` TEXT NOT NULL,
`dept_name` TEXT NULL DEFAULT NULL,
`location_zip` INT NULL DEFAULT NULL,
PRIMARY KEY (`dept_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;




-- -----------------------------------------------------
-- Table `employees`.`employee_healthplan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`employee_healthplan` (
`health_plan_id` INT NOT NULL,
`plan_name` TEXT NULL DEFAULT NULL,
`deduction` DOUBLE NULL DEFAULT NULL,
PRIMARY KEY (`health_plan_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;




-- -----------------------------------------------------
-- Table `employees`.`job_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`job_category` (
`job_category` INT NOT NULL,
`hourly_rate` DOUBLE NULL DEFAULT NULL,
`title` TEXT NULL DEFAULT NULL,
PRIMARY KEY (`job_category`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;




-- -----------------------------------------------------
-- Table `employees`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`employees` (
`emp_no` INT NOT NULL,
`birth_date` TEXT NULL DEFAULT NULL,
`first_name` TEXT NULL DEFAULT NULL,
`last_name` TEXT NULL DEFAULT NULL,
`gender` TEXT NULL DEFAULT NULL,
`hire_date` TEXT NULL DEFAULT NULL,
`job_category` INT NULL DEFAULT NULL,
`health_plan_id` INT NULL DEFAULT NULL,
`retirement_saving` DOUBLE NULL DEFAULT NULL,
`deposit_bankrouting_number` INT NULL DEFAULT NULL,
`deposit_bankaccount_number` INT NULL DEFAULT NULL,
`employee_healthplan_health_plan_id` INT NOT NULL,
`job_category_job_category` INT NOT NULL,
`departments_dept_no` TEXT NOT NULL,
PRIMARY KEY (`emp_no`, `employee_healthplan_health_plan_id`, `job_category_job_category`, `departments_dept_no`),
INDEX `fk_employees_employee_healthplan_idx` (`employee_healthplan_health_plan_id` ASC) VISIBLE,
INDEX `fk_employees_job_category1_idx` (`job_category_job_category` ASC) VISIBLE,
INDEX `fk_employees_departments1_idx` (`departments_dept_no` ASC) VISIBLE,
CONSTRAINT `fk_employees_employee_healthplan`
FOREIGN KEY (`employee_healthplan_health_plan_id`)
REFERENCES `employees`.`employee_healthplan` (`health_plan_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_employees_job_category1`
FOREIGN KEY (`job_category_job_category`)
REFERENCES `employees`.`job_category` (`job_category`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_employees_departments1`
FOREIGN KEY (`departments_dept_no`)
REFERENCES `employees`.`departments` (`dept_no`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;




-- -----------------------------------------------------
-- Table `employees`.`federal_tax`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`federal_tax` (
`federal_tax_id` INT NOT NULL,
PRIMARY KEY (`federal_tax_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;




-- -----------------------------------------------------
-- Table `employees`.`overtime`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`overtime` (
`overtime_hours` INT NOT NULL,
`overtime_payrate` VARCHAR(45) NULL DEFAULT NULL,
`job_category_job_category` INT NOT NULL,
PRIMARY KEY (`overtime_hours`, `job_category_job_category`),
INDEX `fk_overtime_job_category1_idx` (`job_category_job_category` ASC) VISIBLE,
CONSTRAINT `fk_overtime_job_category1`
FOREIGN KEY (`job_category_job_category`)
REFERENCES `employees`.`job_category` (`job_category`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;




-- -----------------------------------------------------
-- Table `employees`.`state_income_tax`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`state_income_tax` (
`state_income_tax` INT NOT NULL,
`state_location` VARCHAR(45) NULL DEFAULT NULL,
PRIMARY KEY (`state_income_tax`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;




-- -----------------------------------------------------
-- Table `employees`.`payroll_common_deductions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`payroll_common_deductions` (
`federal_tax` DOUBLE NULL DEFAULT NULL,
`state_income_tax` DOUBLE NULL DEFAULT NULL,
`medicare` DOUBLE NULL DEFAULT NULL,
`social_security` DOUBLE NULL DEFAULT NULL,
`Effective_date` TEXT NULL DEFAULT NULL,
`state_income_tax_state_income_tax` INT NOT NULL,
`federal_tax_federal_tax_id` INT NOT NULL,
PRIMARY KEY (`state_income_tax_state_income_tax`, `federal_tax_federal_tax_id`),
INDEX `fk_payroll_common_deductions_federal_tax1_idx` (`federal_tax_federal_tax_id` ASC) VISIBLE,
CONSTRAINT `fk_payroll_common_deductions_state_income_tax1`
FOREIGN KEY (`state_income_tax_state_income_tax`)
REFERENCES `employees`.`state_income_tax` (`state_income_tax`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_payroll_common_deductions_federal_tax1`
FOREIGN KEY (`federal_tax_federal_tax_id`)
REFERENCES `employees`.`federal_tax` (`federal_tax_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;




-- -----------------------------------------------------
-- Table `employees`.`payslip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`payslip` (
`emp_no` TEXT NULL DEFAULT NULL,
`emp_name` TEXT NULL DEFAULT NULL,
`pay_start_date` TEXT NULL DEFAULT NULL,
`pay_end_date` TEXT NULL DEFAULT NULL,
`hours_worked` TEXT NULL DEFAULT NULL,
`Overtime` TEXT NULL DEFAULT NULL,
`grosspay` TEXT NULL DEFAULT NULL,
`healthplan_deduction` TEXT NULL DEFAULT NULL,
`federal_tax` TEXT NULL DEFAULT NULL,
`state_income_tax` TEXT NULL DEFAULT NULL,
`medicare` TEXT NULL DEFAULT NULL,
`social_security` TEXT NULL DEFAULT NULL,
`retirement_saving` TEXT NULL DEFAULT NULL,
`netpay` TEXT NULL DEFAULT NULL,
`deposit_bankrouting` TEXT NULL DEFAULT NULL,
`deposit_bankaccount` TEXT NULL DEFAULT NULL,
`date_deposited` TEXT NULL DEFAULT NULL,
`dept_no` TEXT NULL DEFAULT NULL,
`employees_emp_no` INT NOT NULL,
`employees_employee_healthplan_health_plan_id` INT NOT NULL,
`employees_job_category_job_category` INT NOT NULL,
`employees_departments_dept_no` TEXT NOT NULL,
PRIMARY KEY (`employees_emp_no`, `employees_employee_healthplan_health_plan_id`, `employees_job_category_job_category`, `employees_departments_dept_no`),
CONSTRAINT `fk_payslip_employees1`
FOREIGN KEY (`employees_emp_no` , `employees_employee_healthplan_health_plan_id` , `employees_job_category_job_category` , `employees_departments_dept_no`)
REFERENCES `employees`.`employees` (`emp_no` , `employee_healthplan_health_plan_id` , `job_category_job_category` , `departments_dept_no`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;




-- -----------------------------------------------------
-- Table `employees`.`salaries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`salaries` (
`emp_no` INT NULL DEFAULT NULL,
`salary` INT NULL DEFAULT NULL,
`from_date` TEXT NULL DEFAULT NULL,
`to_date` TEXT NULL DEFAULT NULL,
`employees_emp_no` INT NOT NULL,
`employees_employee_healthplan_health_plan_id` INT NOT NULL,
`employees_job_category_job_category` INT NOT NULL,
PRIMARY KEY (`employees_emp_no`, `employees_employee_healthplan_health_plan_id`, `employees_job_category_job_category`),
CONSTRAINT `fk_salaries_employees1`
FOREIGN KEY (`employees_emp_no` , `employees_employee_healthplan_health_plan_id` , `employees_job_category_job_category`)
REFERENCES `employees`.`employees` (`emp_no` , `employee_healthplan_health_plan_id` , `job_category_job_category`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;




-- -----------------------------------------------------
-- Table `employees`.`salary_audit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`salary_audit` (
`emp_no` INT NULL DEFAULT NULL,
`salary` INT NULL DEFAULT NULL,
`from_date` TEXT NULL DEFAULT NULL,
`to_date` TEXT NULL DEFAULT NULL,
`last_operation` TEXT NULL DEFAULT NULL,
`last_update_date` TEXT NULL DEFAULT NULL,
`employees_emp_no` INT NOT NULL,
`employees_employee_healthplan_health_plan_id` INT NOT NULL,
`employees_job_category_job_category` INT NOT NULL,
PRIMARY KEY (`employees_emp_no`, `employees_employee_healthplan_health_plan_id`, `employees_job_category_job_category`),
CONSTRAINT `fk_salary_audit_employees1`
FOREIGN KEY (`employees_emp_no` , `employees_employee_healthplan_health_plan_id` , `employees_job_category_job_category`)
REFERENCES `employees`.`employees` (`emp_no` , `employee_healthplan_health_plan_id` , `job_category_job_category`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;




-- -----------------------------------------------------
-- Table `employees`.`timesheet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employees`.`timesheet` (
`emp_No` INT NULL DEFAULT NULL,
`from_date` TEXT NULL DEFAULT NULL,
`to_date` TEXT NULL DEFAULT NULL,
`hours` DOUBLE NULL DEFAULT NULL,
`group_number` INT NULL DEFAULT NULL,
`employees_emp_no` INT NOT NULL,
`employees_employee_healthplan_health_plan_id` INT NOT NULL,
`employees_job_category_job_category` INT NOT NULL,
PRIMARY KEY (`employees_emp_no`, `employees_employee_healthplan_health_plan_id`, `employees_job_category_job_category`),
CONSTRAINT `fk_timesheet_employees1`
FOREIGN KEY (`employees_emp_no` , `employees_employee_healthplan_health_plan_id` , `employees_job_category_job_category`)
REFERENCES `employees`.`employees` (`emp_no` , `employee_healthplan_health_plan_id` , `job_category_job_category`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;




SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;