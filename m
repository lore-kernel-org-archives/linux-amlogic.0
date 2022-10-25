Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E39EC04A95
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Oct 2022 15:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSW9o8Hj6z0bieFysqZUWVhXF8ocCkFFaLGfWzYkOoU=; b=K+fKLkln9N4b1T
	Q0UDQGEEvsYzLnrF0MAJCFG5LwtRhhKGnUmP2sSM/W3v8kz8FTGImoiSo0A4A0XsYqmxTYVX8RV9d
	kDGUHFzU0jAUFW9Exg7xQnLhK7w7E429kwFrmSVEwQZRqCtLHwRcyJKGhc8Eh8HvGKaXRPb4qv7HS
	R8B4YRXE7lBgo267/r7MmvKah3RDssvdyxiQHIA0LckEzTAGjfKfSO4I2Jfm+Iym3YOZuS2n6+89N
	OXERexKhHVXv6n2qH5B9Db8Ycb6gRkCxKe0Jog7uohYNSbzkHODLYdP2IWnzc+i1d9Laux/79SPrL
	JaZ0GNHZYBA92vtrlXGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onLfG-0062Im-3N; Tue, 25 Oct 2022 15:16:26 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onLfC-0062Hc-Ti
	for linux-amlogic@lists.infradead.org; Tue, 25 Oct 2022 15:16:24 +0000
Received: by mail-wr1-x42c.google.com with SMTP id bp11so21093910wrb.9
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Oct 2022 08:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlhclRXrpi15eP5veKrpsxoPmhuZ9sMxnY9PN21CLSo=;
        b=K3CCs46NYW6swH5+Ru6/aJtLYjyFHpf2ZDucIc7NhHumD6YNIBmhk9AuLcWXtxZbvV
         anRJbDUSyYYR1lxT/aRkPlD/atL4B49eb6l6DQ2L0PzvqbjGX7e81eZdWeA19GtWHYsZ
         TmNKJhJwNE31bTSArzrEiJ5rPmzqnGQdq/20xzAUtc3DsUrAQOyXcrFGn7FKZMSmlFZT
         8jrkfpoNVPomKCCp/3gTVslPoAjk2DMFmR3bJl9lxGhPl9kDf3nhSjZPuAYzXQObnoLe
         +eMJ4Th8R5x83Xvv9wUC03uDE+nhAXiltR5bKbg1OpvPTq3yUMbPB/QIpZopi6egX0Lw
         voLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlhclRXrpi15eP5veKrpsxoPmhuZ9sMxnY9PN21CLSo=;
        b=daXHLKf5JYu3wWwC6IyUBtI+iZhi3DJ6n1ZGbRgMm1IzQ+44UZ37Wimx9XPHf5vH+k
         wZ1jSzmmB5BDUO6kcGGr0fSgAVdu0RVecV+fz9+TbMk2ESh97Tlu86uJ/uTRGvzyEKJg
         wCwcFQVr1TOM0CCU+jVsLiJXOqn/wTWeiiHwUaBbCgm/xkYjEz3MRXwLr/dPfezTzSPj
         JegFYeBwQf7HYTxIPF4KCI6lQ+y39P2b2yH56ukYvHtoiVkJfbaaPfND1KhSk5JYgOjY
         uU/oU+RypsyYWdleGwRX7woA2k5BQOT9ebDhkNnzChc+gfOHJJRj1lFbalRzbWrvhNn4
         j5Dw==
X-Gm-Message-State: ACrzQf1+6rpKgnd+2wgz6H7ml9xxt65Z+G30UJPU2WA+MmZd9m3WlGgn
	GOpTVD1p3+hmSsyfzP2whw64ug==
X-Google-Smtp-Source: AMsMyM6L6kpQndXeoqqxhDSBLPTTYSKha+j1IWyqcsW4prVtDN34/Z9ZUfHJ1RGt2LzWaviLDaPgGw==
X-Received: by 2002:a5d:6f02:0:b0:22f:5fd3:f7c4 with SMTP id ay2-20020a5d6f02000000b0022f5fd3f7c4mr25314476wrb.423.1666710981011;
        Tue, 25 Oct 2022 08:16:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id r13-20020a05600c458d00b003c6f3f6675bsm11577822wmo.26.2022.10.25.08.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 08:16:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: u-boot@lists.denx.de, linux-amlogic@lists.infradead.org, Christian Hewitt <christianshewitt@gmail.com>,
 u-boot-amlogic@groups.io
In-Reply-To: <20221025143205.14470-1-christianshewitt@gmail.com>
References: <20221025143205.14470-1-christianshewitt@gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: nanopi-k2: readd PHY reset properties
Message-Id: <166671098029.66253.1659888075300795635.b4-ty@linaro.org>
Date: Tue, 25 Oct 2022 17:16:20 +0200
MIME-Version: 1.0
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_081622_977961_0AE15394 
X-CRM114-Status: UNSURE (   7.48  )
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

On Tue, 25 Oct 2022 14:32:05 +0000, Christian Hewitt wrote:
> The sync of device-tree/bindings in 11a48a5a18c6 ("Linux 5.6-rc2") causes
> Ethernet to break on some GXBB boards; the PHY seems to need proper reset
> timing to function in u-boot and Linux. Re-add the old PHY reset binding
> for dwmac until we support new bindings in the PHY node. This borrows the
> same fix applied to the Odroid C2 board [0].
> 
> [0] https://lists.denx.de/pipermail/u-boot/2021-April/446658.html
> 
> [...]

Thanks, Applied to https://source.denx.de/u-boot/custodians/u-boot-amlogic (u-boot-amlogic-test)

[1/1] arm64: dts: meson: nanopi-k2: readd PHY reset properties
      https://source.denx.de/u-boot/custodians/u-boot-amlogic/-/commit/7b70f68977578360d9c47bb25d6d1937075153b4

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
