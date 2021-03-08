Return-Path: <SRS0=LTpV=IG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B0EC433DB
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Mar 2021 17:30:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14463652A8
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Mar 2021 17:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14463652A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=okqXtNs56g2n3uXsag7muctlR04ZeufBR8yRhIwQ1SM=; b=E00QgyqqW1f0ThqfPLPfzZqMY
	QtLVGKmlMISZ7tBUYFKNIlhgza9Cl5DxoQKt3fNYSyJWdcb2xQui+olKBCKZAmbnoVw13iM3Rke0A
	g0zjrK/lv9SG/iLJ0d+6dycbc9SnA1KBrHHdfsQRgdCxQLl57em17DWn3rWGj2HhiujKafpM7bXK1
	6lae8KPV0mYfUEiDp/6ioIvvkQn2JdcTIK9D808GR4GNXiENP0vxgB46o0YiC2HM44Tu3+i+8M1Qr
	7HTA9kJ+R5rP0AAsS29y6nTlWSmPbVvYbDtXoKu6b8hFX7t88AhPZK2u32+Lj1t3Bf9pKqMtm3z7E
	SNEnBaK+Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJJhv-001PPa-R7; Mon, 08 Mar 2021 17:30:15 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJJhr-001PLv-4c
 for linux-amlogic@lists.infradead.org; Mon, 08 Mar 2021 17:30:13 +0000
Received: by mail-pl1-x62c.google.com with SMTP id u18so5174537plc.12
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Mar 2021 09:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=pPr4TEZg8eRFsyyC0gyS8i3k7JNesoOp96Z0bqlYwW8=;
 b=AIgOCaFbfqm0PaTD5lY7ZMlRGv3BK5ulfABakddZh+yraj0Z3osw9OBnVEveESDti/
 5veeMZojLMgcVELHBcHwhDsRxyGdFr/04Qk3eAIZSY/J6G36AFtpcbGeE+hmXx50va3j
 QUQFfh8+8v7XhuVYcx3WW1/d1WX9dHJGebyEWf+aUDHVLEhnU1Bv60Ri5FEF/nKOyRct
 X2eZWLlyF+LuN3IRcDG0TJIagjA+l8aBnC0BaOM4JX8I+XF9vm6TYacx8HQNc0/X2ECs
 hngsoTdA6ZeJYgjE8GaM+6cXJh0qxbfNJmY9ynovnXORcaJ2SpusQTqy8fNMgvwVkpM6
 DuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=pPr4TEZg8eRFsyyC0gyS8i3k7JNesoOp96Z0bqlYwW8=;
 b=oSkETxNle9CnX1jRFK97ogDgebDGE/P1tWE528KRdrnRg9e6ZiObGf0l6c7X/cnRxU
 fUQ6zxepe8iqzwEXK5bcznBgp7rw4o1avgbBFv7QW9zM05XhqxWuFqBX//cYNjb1mEw3
 KNDNlIZi+UtGmdSa8F9CiCD3BbcARQ2FY3zU9sHzf4ebF9R2nSCuuTJzI84FE+ubfU+D
 QJJ4mBdE9FEmZCu4sCUKRoH15ZhoEBoik2Y2CO9mfomczw/bOL84v0QV78qRJhooMGAY
 w1pfNPZI50x7PEgaxwlin7iQHjhXIOqZQZV7k5wLjz2Wgf4ywBwmZQUwW8xWBVrLqcSo
 qHtQ==
X-Gm-Message-State: AOAM533aZuRXm3VaXoWJbimq6wy0/5HPrFL9uNl0tYY/8hPfgQwHTjFR
 Iai5wne2gkeP5SbV8ni6Fghdiw==
X-Google-Smtp-Source: ABdhPJxp5FeOMPK9+lFtnyew8n2+3htoOnuDitU9jh66jK7OhfS4uRrdaIbOVg97usDkp6nVL8TiGw==
X-Received: by 2002:a17:90b:120f:: with SMTP id
 gl15mr25787521pjb.77.1615224608902; 
 Mon, 08 Mar 2021 09:30:08 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 35sm10489466pgm.64.2021.03.08.09.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:30:08 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 christianshewitt@gmail.com, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: Re: [PATCH] drm: meson_drv add shutdown function
In-Reply-To: <20210302042202.3728113-1-art@khadas.com>
References: <20210302042202.3728113-1-art@khadas.com>
Date: Mon, 08 Mar 2021 09:30:07 -0800
Message-ID: <7ho8ft365c.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_173011_427888_E63F51B0 
X-CRM114-Status: UNSURE (   5.63  )
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

Artem Lapkin <email2tema@gmail.com> writes:

> Problem: random stucks on reboot stage about 1/20 stuck/reboots
> // debug kernel log
> [    4.496660] reboot: kernel restart prepare CMD:(null)
> [    4.498114] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
> [    4.503949] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
> ...STUCK...
>
> Solution: add shutdown function to meson_drm driver 
> // debug kernel log
> [    5.231896] reboot: kernel restart prepare CMD:(null)
> [    5.246135] [drm:meson_drv_shutdown]
> ...
> [    5.259271] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
> [    5.274688] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
> [    5.338331] reboot: Restarting system
> [    5.358293] psci: PSCI_0_2_FN_SYSTEM_RESET reboot_mode:0 cmd:(null)
> bl31 reboot reason: 0xd
> bl31 reboot reason: 0x0
> system cmd  1.
> ...REBOOT...
>
> Tested: on VIM1 VIM2 VIM3 VIM3L khadas sbcs - 1000+ successful reboots
> and Odroid boards, WeTek Play2 (GXBB)
>
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Artem Lapkin <art@khadas.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
