Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90617C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jan 2022 20:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AWLmdmgr2dWk5IV+NPyyV9HqqXDAsE9DwkZgpPYSaPg=; b=HPfRAwBhh+kukf
	Kfe6Pg4Q5J2dlFY1pBeVPJvpfwefRtDmQczbiFQ/fV1HPUmQQEV/+6khjjNtFIa0JcivyeOjvn1I9
	neQvwX2Ck3a96so5ZHNXjpaun3/uH41tKsMCpmX2XwypSci0JkpdVcN8GvEe5XxAQ7gKc3vwqtLVe
	Nq23HKgqO88nTq7FMRK+5lwRJWDdmxigqYiAwM77ASXGpc0BikhK+ZCvB/SD/NMqUvPMzH819ktfD
	wBb+A/yBCHzCPjFT3f5ik+18GFLg2Co+S5SELVtUCDfd3nkBKZZ4DD2DHDm0RhADN/exVNEOjl6Ju
	wIgoY5wpzN12dYISoaxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC5Xs-0050zy-0M; Mon, 24 Jan 2022 20:02:32 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC5Xp-0050ym-UD
 for linux-amlogic@lists.infradead.org; Mon, 24 Jan 2022 20:02:31 +0000
Received: by mail-pl1-x62d.google.com with SMTP id t18so16896508plg.9
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Jan 2022 12:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=YEJC09BaXrXowCgo9lvcrsFTV9cTaqg/eq8tuzFMaPw=;
 b=DLTXaapbxBx8Ck2RAOi8Km23rVDe/NrQim0Hyuk9wVITZr/4LaUJWCmM6ZbgIdHD5+
 Bfbyk94aQIaY1Rc+qGCqqMdFebGLVBDH96OROrgotIHdW4Hh1dhVpWkfWTn0q4Te3Pgj
 aSfCuKXWAQ/cZJ1OyKX80U3Vyd1/5T8MhgqNBA/rp/ewQIcdx+4TY/xZVbIDvyn0D+ZK
 ECdAoT2mVumJv3G+w1blktv69GFp0n4Mr6Gy7flDMz8sym5urBR1piAz0EmnubjfByUv
 je+eezmQoun/pWIz0vxjehkBQF/etGyOdFNp4dPOQ530mru/TUA1BjBlZXxiFbzeGk5t
 08YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=YEJC09BaXrXowCgo9lvcrsFTV9cTaqg/eq8tuzFMaPw=;
 b=V0CY2O8uyGxwxELj62Tj5gEFiEvWavNKYcDlAVKskQTXDhDNU5aJsMi9YWGv5byuND
 /jkbjAKtU91kKeG1FFTb1BByj7oE67aQN7GQgjUF2T225KrX1Yb/mUmDHxGqA4KYYhhM
 jBEtG25LwpJMF8Z+NTQk2xLTPWiKVcQF7nAkIV8QbqFNqdvr6/4HsgPlp0iy6okzHYvf
 E3FHwpywrQ7oLxjrZ4crmP+vuZLPlsek255lBpDUtMvrW7JHz6tUQLVXqfTvRy8DplVB
 XZT76oIPOw1iEL22fLC2J9iothIBTCgmNaFgE5T0CjXKC9dG4o1cSQhj5kgwGg0dpmVQ
 6JPg==
X-Gm-Message-State: AOAM532z9xaOnIMX3g8R8lUQ0r/Q6CC7qy6g1ssCDwJI1YP1GPtfhORV
 eRlZq1LtqgUNU3Lqff+0JeY1Ax2N7+4bLDT8
X-Google-Smtp-Source: ABdhPJyiTOFUPgKGEwmWzQPhRYM03CkpcJgdqO1Y7YACYLF7j4l4I+LB4xnmrsL4Sfps2GBC71HDOA==
X-Received: by 2002:a17:902:9a49:b0:149:7b66:e85c with SMTP id
 x9-20020a1709029a4900b001497b66e85cmr16054144plv.66.1643054549104; 
 Mon, 24 Jan 2022 12:02:29 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id q7sm15972777pfs.32.2022.01.24.12.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:02:28 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Neil Armstrong
 <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>, Furkan Kardame
 <furkan@fkardame.com>
Subject: Re: [PATCH 0/3] arm64: dts: meson: add BL32 reserved region to
 Beelink g12b devices
In-Reply-To: <20220122073221.2398-1-christianshewitt@gmail.com>
References: <20220122073221.2398-1-christianshewitt@gmail.com>
Date: Mon, 24 Jan 2022 12:02:28 -0800
Message-ID: <7h7daoyka3.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_120230_028271_2C8364F4 
X-CRM114-Status: UNSURE (   8.26  )
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

Christian Hewitt <christianshewitt@gmail.com> writes:

> This resolves a long-running issue where Beelink GT-King/Pro and
> GS-King-X wedge on boot or shortly after when booting from vendor
> u-boot. In some distros the issue is often reported as triggered
> by large file transfers to/from USB or SD cards. Reserving the
> BL32 memory region prevents the issue.

The BL32 is typically common for the SoC family, so this change should
probably go into the g12b.dtsi.  Or probably even
meson-g12-common.dtsi, which is where the BL31 reserved-memory is
described.

Kevin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
