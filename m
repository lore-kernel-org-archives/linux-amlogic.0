From: wsa@the-dreams.de (Wolfram Sang)
Date: Thu, 23 Mar 2017 21:34:04 +0100
Subject: [PATCH v4 05/10] i2c: meson: use full 12 bits for clock divider
In-Reply-To: <fbc241ed-ec1e-b433-50af-5d0ebca09711@gmail.com>
References: <1a2ecdc8-a326-a7a7-22ec-658fd147daf4@gmail.com>
 <fbc241ed-ec1e-b433-50af-5d0ebca09711@gmail.com>
Message-ID: <20170323203404.nuobb4wtgsepnilu@ninjato>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


> +	/* clock divider has 12 bits */
> +	WARN_ON(div >= (1 << 12));

Do you insist on WARN_ON? I wonder what it gives over dev_err?

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20170323/7e79ac35/attachment.sig>
