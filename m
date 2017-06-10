From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 10 Jun 2017 23:57:37 +0200
Subject: [PATCH v7 5/9] gpiolib: export gpiochip_irq_reqres and
 gpiochip_irq_relres
In-Reply-To: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
References: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
Message-ID: <e6618077-a362-86cf-7cd3-f46de39396e4@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Customized versions of the request_resources and release_resources
callbacks usually just extend what is available in gpiochip_irq_reqres
and gpiochip_irq_relres. Therefore export them to make them available
to gpio drivers.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/gpio/gpiolib.c      | 6 ++++--
 include/linux/gpio/driver.h | 3 +++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 62ffb4e2..4d666abb 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1643,7 +1643,7 @@ static const struct irq_domain_ops gpiochip_domain_ops = {
 	.xlate	= irq_domain_xlate_twocell,
 };
 
-static int gpiochip_irq_reqres(struct irq_data *d)
+int gpiochip_irq_reqres(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
 
@@ -1659,14 +1659,16 @@ static int gpiochip_irq_reqres(struct irq_data *d)
 	}
 	return 0;
 }
+EXPORT_SYMBOL_GPL(gpiochip_irq_reqres);
 
-static void gpiochip_irq_relres(struct irq_data *d)
+void gpiochip_irq_relres(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
 
 	gpiochip_unlock_as_irq(chip, d->hwirq);
 	module_put(chip->gpiodev->owner);
 }
+EXPORT_SYMBOL_GPL(gpiochip_irq_relres);
 
 static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index af20369e..82bc27de 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -262,6 +262,9 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 			     bool nested,
 			     struct lock_class_key *lock_key);
 
+int gpiochip_irq_reqres(struct irq_data *d);
+void gpiochip_irq_relres(struct irq_data *d);
+
 #ifdef CONFIG_LOCKDEP
 
 /*
-- 
2.13.1
