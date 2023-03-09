CREATE TABLE Employees (
    Emp_Id INT,
    Emp_name VARCHAR(50),
    gender VARCHAR(50),
    Doj DATE,
    Dept VARCHAR(50),
    City VARCHAR(50),
    Salary VARCHAR(50)
);
CREATE OR REPLACE FUNCTION salary_conversion()
RETURNS TRIGGER AS $$
BEGIN
    BEGIN
        NEW.Salary = CASE 
                        WHEN NEW.Salary ~ '^\$[-+]?[0-9]*\.?[0-9]+$' THEN CAST(SUBSTRING(NEW.Salary, 2) AS NUMERIC(10,2))
                        ELSE 50000
                     END;
    EXCEPTION WHEN others THEN
        NEW.Salary = 50000;
    END;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER salary_conversion_trigger
BEFORE INSERT ON Employees
FOR EACH ROW
EXECUTE FUNCTION salary_conversion();


CREATE OR REPLACE FUNCTION gender_check() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.gender NOT IN ('Male', 'Female') THEN
        NEW.gender := 'undeclared';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER gender_check_trigger
BEFORE INSERT ON Employees
FOR EACH ROW
EXECUTE FUNCTION gender_check();

insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (1, 'Ezekiel', 'Male', '7/31/2020', 'Accounting', 'Listvyanskiy', '$71280.38');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (2, 'Haskell', 'Male', '4/15/2016', 'Sales', 'Sukasirna', '$54316.99');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (3, 'Modesta', 'Female', '1/8/2014', 'Sales', 'Al ‘Anān', '$60310.51');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (4, 'Jo-anne', 'Female', '12/9/2020', 'Human Resources', 'Patos de Minas', '$75961.48');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (5, 'Olenka', 'Female', '1/2/2020', 'Human Resources', 'Gambaru', '$62345.37');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (6, 'Butch', 'Male', '3/29/2014', 'Sales', 'Ar Rujum', '$70412.77');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (7, 'Silvain', 'Male', '8/11/2019', 'Research and Development', 'Legionowo', '$10073.88');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (8, 'Dalli', 'Male', '2/19/2011', 'Accounting', 'Santa Rosa de Copán', '$148770.47');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (9, 'Pam', 'Female', '7/19/2009', 'Research and Development', 'Abidjan', '$186809.87');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (10, 'Adriena', 'Female', '9/3/2015', 'Business Development', 'Derzhavīnsk', '$146660.14');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (11, 'Marsha', 'Female', '10/9/2018', 'Accounting', 'Jiabei', '$137586.41');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (12, 'Cally', 'Female', '5/6/2022', 'Marketing', 'Dongdu', '$85429.45');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (13, 'Armand', 'Male', '9/21/2019', 'Product Management', 'Mahikeng', '$186106.39');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (14, 'Mei', 'Female', '9/27/2015', 'Legal', 'Kuloy', '$41780.92');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (15, 'Shandie', 'Female', '3/9/2014', 'Legal', 'Gudermes', '$58854.36');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (16, 'Esdras', 'Male', '6/18/2021', 'Research and Development', 'Mahaba', '$139268.81');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (17, 'Sheena', 'Female', '6/14/2011', 'Human Resources', 'Jidd Ḩafş', '$47582.83');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (18, 'Jilly', 'Genderfluid', '5/13/2007', 'Support', 'Yisa', '$178989.74');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (19, 'Fraze', 'Genderqueer', '9/22/2020', 'Human Resources', 'Putat Lor', '$78286.38');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (20, 'Guinevere', 'Female', '8/24/2007', 'Business Development', 'Nanton', '$22003.60');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (21, 'Myriam', 'Female', '8/24/2018', 'Human Resources', 'Jajawai', '$69879.11');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (22, 'Lissie', 'Female', '5/6/2009', 'Product Management', 'Bojonegoro', '$129620.69');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (23, 'Herman', 'Bigender', '12/28/2014', 'Engineering', 'Tanushimarumachi-toyoki', '$166115.41');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (24, 'Wandie', 'Female', '7/20/2017', 'Business Development', 'Basista', '$81887.56');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (25, 'Caryl', 'Female', '11/20/2014', 'Business Development', 'Sumberpitu', '$153009.74');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (26, 'Valentine', 'Non-binary', '11/23/2016', 'Accounting', 'Zhaoguli', '$137709.39');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (27, 'Reg', 'Male', '5/24/2013', 'Sales', 'Oyem', '$44455.44');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (28, 'Giustina', 'Female', '5/9/2013', 'Product Management', 'Adámas', '$126998.58');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (29, 'Phyllys', 'Female', '11/18/2009', 'Services', 'Barra do Bugres', '$170036.11');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (30, 'Darbee', 'Male', '1/27/2007', 'Business Development', 'Lusaka', '$25050.01');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (31, 'Jonathan', 'Male', '8/22/2015', 'Services', 'Taclobo', '$196763.15');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (32, 'Malena', 'Female', '12/21/2018', 'Marketing', 'San Sebastian', '$156965.59');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (33, 'Joann', 'Female', '10/7/2015', 'Research and Development', 'Sebba', '$161189.16');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (34, 'Denyse', 'Polygender', '6/18/2007', 'Services', 'Jalanbaru', '$172101.88');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (35, 'Ahmad', 'Male', '9/13/2015', 'Marketing', 'Dame-Marie', '$147996.08');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (36, 'Antonius', 'Male', '12/19/2020', 'Support', 'Stockholm', '$42566.05');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (37, 'Adele', 'Female', '2/17/2020', 'Engineering', 'Leppävirta', '$78505.22');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (38, 'Buiron', 'Male', '6/29/2007', 'Research and Development', 'Baraba', '$75748.03');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (39, 'Valli', 'Female', '4/16/2021', 'Marketing', 'Atbasar', '$52036.76');
insert into Employees (Emp_Id, Emp_name, gender, Doj, Dept, City, Salary) values (40, 'Melvyn', 'Male', '1/6/2018', 'Marketing', 'Fangtang', '$85155.78');

ALTER TABLE Employees ADD COLUMN age INT;

UPDATE Employees SET age = FLOOR(RANDOM() * (65 - 20 + 1) + 20) WHERE age IS NULL;

update employees set salary = salary * 1.15 where age in (select age from employees where age >= 27);

select Employees.emp_id, Employees.emp_name, departments.dept from Employees join departments on departments.dept = Employees.dept;
//refer to practice_joins.sql
select dept, sum(salary) as total_sal from Employees group by dept;