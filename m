From: hs@denx.de (Heiko Schocher)
Date: Thu, 7 Dec 2017 13:19:39 +0100
Subject: [PATCH 2/4] i2c: meson: reduce timeout
In-Reply-To: <20171126164057.27728-3-b.galvani@gmail.com>
References: <20171126164057.27728-1-b.galvani@gmail.com>
 <20171126164057.27728-3-b.galvani@gmail.com>
Message-ID: <ac7cb52b-7547-9d78-efbe-c5e59367776c@denx.de>
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

Applied to u-boot-i2c master

Thanks!

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs at denx.de
