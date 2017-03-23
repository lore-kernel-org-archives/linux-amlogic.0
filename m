From: wsa@the-dreams.de (Wolfram Sang)
Date: Thu, 23 Mar 2017 21:33:09 +0100
Subject: [PATCH v4 04/10] i2c: meson: use i2c core for DT clock-frequency
 parsing
In-Reply-To: <96c1b005-063e-ae22-ded4-fbb0b023f02b@gmail.com>
References: <1a2ecdc8-a326-a7a7-22ec-658fd147daf4@gmail.com>
 <96c1b005-063e-ae22-ded4-fbb0b023f02b@gmail.com>
Message-ID: <20170323203309.op7jepa4be2mwkop@ninjato>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


> +- i2c-scl-falling-time-ns
> +  Number of nanoseconds the SCL signal takes to fall; t(f) in the I2C
> +  specification.
> +
> +- i2c-scl-internal-delay-ns
> +  Number of nanoseconds the IP core additionally needs to setup SCL.
> +
> +- i2c-scl-rising-time-ns
> +  Number of nanoseconds the SCL signal takes to rise; t(r) in the I2C
> +  specification.
> +
> +- i2c-sda-falling-time-ns
> +  Number of nanoseconds the SDA signal takes to fall; t(f) in the I2C
> +  specification.

Those are not used currently. Can the driver be updated to make use of
them? Otherwise, we might just skip this section.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20170323/81bcc5c5/attachment.sig>
