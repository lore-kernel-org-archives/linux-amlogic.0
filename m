From: khilman@baylibre.com (Kevin Hilman)
Date: Thu, 08 Mar 2018 11:54:14 -0800
Subject: [PATCH] firmware: meson-sm: rework meson_sm_init to use
 module_platform_driver_probe
In-Reply-To: <1520336869-25224-1-git-send-email-sudeep.holla@arm.com> (Sudeep
 Holla's message of "Tue, 6 Mar 2018 11:47:49 +0000")
References: <1520336869-25224-1-git-send-email-sudeep.holla@arm.com>
Message-ID: <7hd10efimx.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Sudeep Holla <sudeep.holla@arm.com> writes:

> Commit 3aa0582fdb82 ("of: platform: populate /firmware/ node from
> of_platform_default_populate_init()") takes care of populating
> all the devices under the /firmware/ node in of_platform_default_populate_init()
>
> This patch reworks meson_sm_init to use module_platform_driver_probe as
> the platform device is populated.
>
> Cc: Carlo Caione <carlo@caione.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: linux-amlogic at lists.infradead.org
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

I gave this a spin through kernelCI.org, and it passed fine on several
amlogic boards, so queuing for v4.17.

Thanks,

Kevin
