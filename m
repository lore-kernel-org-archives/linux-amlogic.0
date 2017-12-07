From: hs@denx.de (Heiko Schocher)
Date: Thu, 7 Dec 2017 09:24:47 +0100
Subject: [PATCH 2/4] i2c: meson: reduce timeout
In-Reply-To: <20171126164057.27728-3-b.galvani@gmail.com>
References: <20171126164057.27728-1-b.galvani@gmail.com>
 <20171126164057.27728-3-b.galvani@gmail.com>
Message-ID: <41282ddf-659e-f573-c8e9-de00906ddc85@denx.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hello Beniamino,

Am 26.11.2017 um 17:40 schrieb Beniamino Galvani:
> The datasheet doesn't specify a suggested timeout and 500ms seems very
> long: reduce it to 100ms.
> 
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>   drivers/i2c/meson_i2c.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Thanks!

Reviewed-by: Heiko Schocher <hs@denx.de>

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs at denx.de
