Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2D7E7717D
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2024 16:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m28uDe1hzBh4Bn9eWZO2tcv4no9hwmT+jzwtvxhDWWE=; b=ehjMtzT6dbzXD9
	blo+SsfcalzJk2myBAKVmJoU9Z9MogjA/M9KJBuBqxtDP5ectTVqRXM31bhMCC7sK+gkBVq3f5yFC
	G36mRQmqlCovxJtgkev0np1Qzdjn2vTydpPd9d2xh8c2NKgIx+a2i/lYI5tmyfQCwXoPwYeMaX1j9
	TNS6yYbYeSpFScWxtvAk8nGaXMLKiIvUopaDVhmy2+0kW2vaNuUD680JjmuGJ7FSCnxeWjfeKw/XA
	vCYhmWUMF6R5AHcQIu/cg7dk0IL/Azs6pOv2RcW4ZbM+aOzO1t/LaXqoUsyWhnkrNyQH70D+LdPLj
	LGfhyO7d3RrQKHzNSuvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgFw-00000008UM0-0vZK;
	Mon, 09 Dec 2024 16:05:08 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgFs-00000008UJp-24Gs
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Dec 2024 16:05:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-434e9716feaso12258545e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Dec 2024 08:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733760302; x=1734365102; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZV6/jGEGN0ycOt9l71mDvvXlfIgyAlXjHfNlD6BSSA=;
        b=La0W/gHEuZ33EfMlHGYxDUatZJtiIH4Yp+lnTEoLVwqQT7NIHf7gh0KSL9dLg88iZI
         QkerX1BUbGvSE2g1PgfSp2zPbOELubygW8zrf8v0IXOwP56mLxm8HpdWpXZONh9ZeXMB
         6yJzJ4a7VV6Zz/Ye4sCjRxPXtdtHNEUu151F7rMSwx1cSds+NGMnQHZT92vVh97EVWFi
         t20MXtS9pHObr80LE2uHb38RM/aIWyZK+X5qbyJkiJwmbZUMQuGYxWuhEm+HYjCBHYT9
         QTBisA+cxDSCRLzwrR7Jht0SXUIUNYa+n+ComgjGkXm2pkm+SylvtgtFygk7RRf7llwG
         NKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733760302; x=1734365102;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZV6/jGEGN0ycOt9l71mDvvXlfIgyAlXjHfNlD6BSSA=;
        b=CvOnIOfBZ9dvpdY+1amzurBCFp9mX+NWApMV/U7+2t7+DcOLS7C2V0CbNx/mWkQAyA
         oUOKHT5vMkFKSXB2mdEmnKnYJfS06G+kG2h4BNW2olsXnQE+4tIsbsB5uibWtf5+OWkE
         LpiJAe3F6ivIbalsqraAJFoukmlxwjllLGs4TbolUpFpwmVuTyo/yfYELXH/5wyuc7QM
         ySoC17LI5pGABqFCWLSQDLal/aV+qIHWRffudV7jKltCBp9+kCTy/mW/TQEYjZdApg8p
         fUYK7miaeIrOC9JCfp8kdwAerlKvL6s9RQ9K5cIhPiUQ/j4XgsD2XMbh0eww0G4/+tZt
         BC7g==
X-Forwarded-Encrypted: i=1; AJvYcCX0G2Hw0w0Ew9CVq/aYwWpmQaKctuXXybav7XOqVcYZx3oLbnn81Ytg+ycvTOxE4475T0FZodSi2BMab3vf@lists.infradead.org
X-Gm-Message-State: AOJu0YxPfdX7DVAUQMiJNrIXarRe9GN3XNqkDIUGEMFXpoyQEChxUYb0
	KUy6+w8wLnzPOgI3btOPoXJLj7csAT7/oe8ckSDPEBLYs9mw78NYrvjpB+CfATpgo6dHTbyFMS8
	T
X-Gm-Gg: ASbGncsP4hSWDqk6jd6AP0CnP8agqoSRhABJ5wZxcuSqNpYsY6OCulrqiGjK3NXH1xA
	1NEjBOtR+MysUSJHRYStMs1Mmf+sKHmItcSepGqid9EodeZXG77LPHHs7FyyyPUCqgui5dOaQDc
	irCwPkuNdJf27uVMFBjoAPhNeJ/4+8bnFffR6CuemdzaxwdF/81hZ8YAX+JO17GZuA0t4HEcBqG
	pEEsWSZIDkHPxagVc16OcBLAoQXiJ7tXd15pFMyDUW6mZZ6KoKCRWFyDxjbToKt
X-Google-Smtp-Source: AGHT+IF5I9z/yJYWju5kftjmnEGFEfuICa8J5jFX6BR1vJ1MZdpvs0pvrcqwWB9585oM8D3NR9VuUQ==
X-Received: by 2002:a05:600c:21d4:b0:434:fbda:1f36 with SMTP id 5b1f17b1804b1-434fbda20a1mr19800685e9.20.1733760302154;
        Mon, 09 Dec 2024 08:05:02 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:432b:3c3e:b17a:687a])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434f3d89b75sm61459015e9.15.2024.12.09.08.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 08:05:01 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] reset: amlogic: rework auxiliary reset support
Date: Mon, 09 Dec 2024 17:04:33 +0100
Message-Id: <20241209-meson-rst-aux-rework-v1-0-d2afb69cc72e@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABEVV2cC/0WNyw6CMBBFf4V07SRtwcLwK4ZFH1OdKFRbfCTGf
 7fBhctzk3vOWxTKTEWMzVtkenDhtFRQu0b4k12OBBwqCy11p7REmKmkBXJZwd5fkOmZ8hlIG98
 r401vtKjXa6bIr017mH6c6Xav9vU3/uVjs6mV7sFfzlUaOEE9b4mZS+HlCNIN0ughYNu58bEln
 C0EPs0zr2PTBsSIulWOgo9ofXRo9hZ70+3tQD5abG0ng5g+ny9hJWmz8wAAAA==
X-Change-ID: 20241209-meson-rst-aux-rework-e26c716c6762
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=evbbOU+lk70bFQXkzUYim69wTqMh7DKLswkpygTzlc4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnVxUqbrpv5I8zC+5JUxaNorAp8JMBdDpjGJU6s
 h/37CR27LKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ1cVKgAKCRDm/A8cN/La
 heyaEACGUxT73ntzD/EA0m+VipsjkIaKfxH8c9z+qs54HllPKjYPuai4DkVv4BVNp4AoLnpFiOQ
 1WtD65Z8lheHQ+XI50SAi/kEIPd3lPs/but/mmmSpgkkeiif8mNJ6ktANXJDb4O5VoqS+1vaDlR
 uFSx3xKZNSnXjR1zoR1slF6sD9iOBHt4qKLTez8sLBoklq5Ajvfu7QIACvyS/oBuhrQ3UY2nk0z
 /8VlCuRWu2MiGTE9Ke3b2x4hZ+5UVzK6JNhnCHNCxDUu137ri5jByI4NAr//GkuoROMEuumq3js
 SJvMD/ImZ0alJIEmluL9UGj85MOglaJaorvA4UQNeiwSrPhkIidf3iQijIn4vQaYGccdRegmIdT
 lgXuptIF9aRRomeK3vXERe2qO857BVnyDpFQtiLfQnkDQQo/LkMshfRLULiU1D8Fw+gMc3KH82w
 +4nqUxHPaoHuDH8LBeusfv/AGFUU+EWpvIZF/EfTWY11mlQI6gIWZNfxgh4p8L0hNTDvZiPjXb6
 /q2g8+i/j4SNuDRENAFNI9wV3FJm4+WkEBC4iP5HYujfc55M//CI19HIHyCCCIKImfKudHGymMJ
 UBRaa6sDAX5O7Y1KKhsuEBXtwSPfGzk0cN6jo6zgDhiZN3Los4nT8WlJgvsU7AE0JbkRs19eOfw
 99E6tb2SzePIY4A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_080504_539860_F77B2003 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The current implementation of auxiliary reset controller, with the
registration helper in the same module as the driver code, does not
allow to properly decouple the registered auxiliary driver from
the registering one.

This patchset removes the registration helper from the auxiliary reset
driver and changes how regmap is passed, to simplify the interface a bit.

This patcheset depends on:
commit 5ae1a43486fb ("clk: amlogic: axg-audio: revert reset implementation")

The above removes the only user of the auxiliary reset controller, restoring
old implementation as a temporary solution, while it is reworked.

The commit has been applied to clock fixes [1] branch and will eventually
make its way to an rc release.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-fixes&id=5ae1a43486fb3febd5ce78da13eb354f16d049e0

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      reset: amlogic: aux: get regmap through parent device
      reset: amlogic: aux: drop aux registration helper

 drivers/reset/amlogic/reset-meson-aux.c | 85 +++------------------------------
 include/soc/amlogic/reset-meson-aux.h   | 23 ---------
 2 files changed, 6 insertions(+), 102 deletions(-)
---
base-commit: 3d99f9231bedcf9acfb965a97645a8ecfa93a40d
change-id: 20241209-meson-rst-aux-rework-e26c716c6762
prerequisite-change-id: 20241127-clk-audio-fix-rst-missing-0b80628d934b:v2
prerequisite-patch-id: 8bf55ab8ba9db1abea5df2554864a2f4f9c72e77

Best regards,
-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
