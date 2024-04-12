import random

def generate_cnpj():
    n = 9
    n1 = random.randint(0, n)
    n2 = random.randint(0, n)
    n3 = random.randint(0, n)
    n4 = random.randint(0, n)
    n5 = random.randint(0, n)
    n6 = random.randint(0, n)
    n7 = random.randint(0, n)
    n8 = random.randint(0, n)
    n9 = 0
    n10 = 0
    n11 = 0
    n12 = 1
    d1 = n12 * 2 + n11 * 3 + n10 * 4 + n9 * 5 + n8 * 6 + n7 * 7 + n6 * 8 + n5 * 9 + n4 * 2 + n3 * 3 + n2 * 4 + n1 * 5
    d1 = 11 - (d1 % 11)
    if d1 >= 10:
        d1 = 0
    d2 = d1 * 2 + n12 * 3 + n11 * 4 + n10 * 5 + n9 * 6 + n8 * 7 + n7 * 8 + n6 * 9 + n5 * 2 + n4 * 3 + n3 * 4 + n2 * 5 + n1 * 6
    d2 = 11 - (d2 % 11)
    if d2 >= 10:
        d2 = 0
    resultado = f'{n1}{n2}{n3}{n4}{n5}{n6}{n7}{n8}{n9}{n10}{n11}{n12}{d1}{d2}'
    return resultado

def generate_cpf():
    cpf_digits = [random.randint(0, 9) for _ in range(9)]

    sum = 0
    for i, digit in enumerate(cpf_digits, start=2):
        sum += digit * i

    first_verifier_digit = (sum * 10) % 11
    cpf_digits.append(0 if first_verifier_digit == 10 else first_verifier_digit)

    sum = 0
    for i, digit in enumerate(cpf_digits, start=2):
        sum += digit * i

    second_verifier_digit = (sum * 10) % 11
    cpf_digits.append(0 if second_verifier_digit == 10 else second_verifier_digit)

    return ''.join(map(str, cpf_digits))
