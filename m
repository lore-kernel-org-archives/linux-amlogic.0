Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0199C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Feb 2022 08:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79Qn7jURGsPQzhY8G+NcYo3L9OUhngXVaOA4/KgbB3I=; b=BlQoIFoWM4hi4n
	f+BiXpp/TcJd8S/KO+6csF8fRs5OuLygFVIfFmg5PeTy3Z8f6c1IZgAQyZjTVf2aTBUzGpRBxKwun
	OS46zgIAqwelhpSTjAqbEOjEPszRyzMiykDiJghRGV1NgeYRXRhVwY+YpkGXyrxsgSQISQpNtRJF5
	Bjpwr0f6UWnEhv9N3qhZi/QnYnyUrcr8DcLy5W53XOMxl7zF71jaoUmZPFbvQLWrCsbf5bCRiFvIQ
	DJmPbt928iVOBIxnbTo73WlwTT+tLXuhp6WtFFEdrNqsGlBPeDElf4OH55fYfp8nv4+cu4wapb5jy
	RpB9ZHDZ1sW22rXk3TQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFtsL-003l5O-7H; Fri, 04 Feb 2022 08:23:25 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFtsI-003l4D-5I
 for linux-amlogic@lists.infradead.org; Fri, 04 Feb 2022 08:23:24 +0000
Received: by mail-wr1-x42d.google.com with SMTP id s10so7258666wra.5
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Feb 2022 00:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ZFGzXKMw2OtgLno39hurYI13mOmCe8ZCX/+T1DKyBk=;
 b=4+20rbGQc0s74Fddoeq/rb//eeHwhJkpBN3Gd67h7L00wELWlw98rEciKQP4188YSY
 2mhsj+KFM/t4VygbsM/F3xQElHLiUzv2SxEBOG45Q4userSKbNGQZFY8Kde8qr65SAEx
 BOgIwbMpZMYZIe6MVs/Yqr7+7IB+TgF32SJ1e0+QtJ1uJPWCgM22b+kqRGhl48g87ELw
 SGiSjZJJe+TjpTi5+W4k5Dza8eVVCECXhwo3dBYOgomCv2KX66VEl75js5E6gx6apRy/
 YHFfLYkm/bGhYjqktElHeICJVCNwdNHhW00KqGYGqhWfyb6fSMm73WYf0ngWobP4zWYr
 w3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ZFGzXKMw2OtgLno39hurYI13mOmCe8ZCX/+T1DKyBk=;
 b=7TwD7R7OgdpYw2w7ZNewfz6GE3UvOYrFnsFer4tl+U7h2YjZXlZEZDUGM1+sIlrj40
 wpfUiR3d7OkilWAxzkLuk4lzKuuNZnf6EBQ0qagH0FoCzGl1KqGaORoZxQE1Q8mzowpX
 8/YU/idHdG3q9Hsk1EEgDrtHLzruyXx3gtidLITwKq7+vnu8H1KMKL8JDJ4yMqXSP7Cb
 2PXJnb1krNQ6nDmtrzHcqA39zOmYRnQBKhNkg41OSMSpy2xeIFwJlrlUuHoFJyx8pKdM
 3rm8vx/HQjhP9cPB2WDt0VpA/K2CzU6CW/SjYyJQjONCcf6pnD35OqJvwIG5v2u0+YnQ
 E+FA==
X-Gm-Message-State: AOAM533XM5kp98J0eEUC+GE2xfEHTxpjrWYL1gt4ckV16J/iR09GgWh0
 e85n84QKFJyUTp4wtbixUQryOA==
X-Google-Smtp-Source: ABdhPJwAGDBGZvKRTaJ+hdwdrgMRaYygLonxwZBtahRfivmiCgi7dKmq+ylCPyAVkrBnhQEsNvuU5A==
X-Received: by 2002:a05:6000:2c1:: with SMTP id
 o1mr1478335wry.258.1643963000590; 
 Fri, 04 Feb 2022 00:23:20 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:3fbe:ff10:110:739])
 by smtp.gmail.com with ESMTPSA id
 s22sm8914078wmj.38.2022.02.04.00.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 00:23:19 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/3] arm64: dts: meson: add ATF BL32 reserved-memory
 regions
Date: Fri,  4 Feb 2022 09:23:14 +0100
Message-Id: <164396299209.31118.12297547841025620213.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126044954.19069-1-christianshewitt@gmail.com>
References: <20220126044954.19069-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_002322_232720_62BB48A7 
X-CRM114-Status: UNSURE (   9.55  )
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

Hi,

On Wed, 26 Jan 2022 04:49:51 +0000, Christian Hewitt wrote:
> This series supersedes [0] which fixed a long-running kernel panic issue
> seen with Beelink G12B devices booted from Amlogic vendor firmware. The
> same issue exists with a wider set of devices from GXBB to SM1, although
> it is not often seen due to my kernel fork including 'catch-all' patches
> for some time (the meson-gx patch was suggested by Matheusz in 2019) and
> many distros actively supporting Amlogic hardware consuming some or all
> of my regular patchset.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.17/fixes)

[1/3] arm64: dts: meson-gx: add ATF BL32 reserved-memory region
      https://git.kernel.org/amlogic/c/76577c9137456febb05b0e17d244113196a98968
[2/3] arm64: dts: meson-g12: add ATF BL32 reserved-memory region
      https://git.kernel.org/amlogic/c/08982a1b3aa2611c9c711d24825c9002d28536f4
[3/3] arm64: dts: meson-g12: drop BL32 region from SEI510/SEI610
      https://git.kernel.org/amlogic/c/f26573e2bc9dfd551a0d5c6971f18cc546543312

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
