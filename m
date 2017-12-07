From: hs@denx.de (Heiko Schocher)
Date: Thu, 7 Dec 2017 09:25:14 +0100
Subject: [PATCH 3/4] i2c: meson: fix return codes on error
In-Reply-To: <20171126164057.27728-4-b.galvani@gmail.com>
References: <20171126164057.27728-1-b.galvani@gmail.com>
 <20171126164057.27728-4-b.galvani@gmail.com>
Message-ID: <8dce02fc-ce3d-98cf-c925-c5755dee4303@denx.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hello Beniamino,

Am 26.11.2017 um 17:40 schrieb Beniamino Galvani:
> Change meson_i2c_xfer_msg() to return -EREMOTEIO in case of NACK, as
> done by other drivers. Also, don't change the return error in
> meson_i2c_xfer().
> 
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>   drivers/i2c/meson_i2c.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Thanks!

Reviewed-by: Heiko Schocher <hs@denx.de>

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs at denx.de
