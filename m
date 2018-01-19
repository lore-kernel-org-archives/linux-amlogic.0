From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 19 Jan 2018 10:09:21 -0800
Subject: [PATCH 0/2] soc: amlogic: meson-gx-pwrc-vpu: fix two issues
In-Reply-To: <ef5a7b53-867e-3a34-96d2-b22d13526b90@gmail.com> (Heiner
 Kallweit's message of "Thu, 21 Dec 2017 20:37:24 +0100")
References: <ef5a7b53-867e-3a34-96d2-b22d13526b90@gmail.com>
Message-ID: <7h4lnhyb3i.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Heiner,

Heiner Kallweit <hkallweit1@gmail.com> writes:

> This series fixes two issues, one being more cosmetic and the other one
> causing errors during shutdown.
>
> Heiner Kallweit (2):
>   soc: amlogic: meson-gx-pwrc-vpu: don't print error message on probe deferral
>   soc: amlogic: meson-gx-pwrc-vpu: fix error on shutdown when domain is powered off

Queued for v4.17 with Neil's tags.  (branch: v4.17/drivers)

Thanks for the cleanups!

Kevin
