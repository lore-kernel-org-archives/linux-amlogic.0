Return-Path: <SRS0=PyQ3=KM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FF9C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 May 2021 20:37:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B7F1610CB
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 May 2021 20:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B7F1610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IqeJILJ+hBL6dpUGYfJiIm5UQy7P6qtgj6ltUjEYxYo=; b=M60FLR3Stc1TYfHCnngv0nOZeG
	NAo+dcEhu0FyDrKITD7EL4YtomkGFYRzHb495PmRxc1oR1/0913VGZ7kCEFUBUoPgHMpCOLwb3hkm
	iWPY8kngXg+2uFp+xpxg5FLpJQhFa+YIOjKxqr8d5uhdn611+1V/O1GWxW4rkQhwbEx2EA/maqr6d
	xaO89ThDK0iWuZoDDsoQTpTgvDCB5Fj5F604Z6BY7LdmH+eRksvEox0GVQ91bv5u7dd+r135aFBYW
	+Ts48wWZVvBWKTGiykh7M5IWmFMQQ998TVm0Gn0U6E3xUxdpjJFYiieWzZLPxf8HxTltZPwAnDh9c
	xHIBnyQQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lijzp-00G6Av-Ir; Mon, 17 May 2021 20:37:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijzd-00G68X-JE; Mon, 17 May 2021 20:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=+YZN/nHJaoReN5vhe533pLv6vKy4vqgUNAkyLEs9sLo=; b=OnJJoPi8IDgr6GiHo7NgzxSiKt
 hbWS5OPHao1aXcMBHj+wIX8us/gwZjVr5AndO+Qr/bpYIEzxwLJBKhUiyO5GPRKsST5a5cyqPnA8M
 RLI02dZvRmM5pS48EVrx4Wk6F4KYR0wAvrhNdeTiROAeFqUvDtMeDulci3zIsHiN0uWl5sHWLoBZC
 7Xwm0Ct+v6RSyEgRbjWGDajHT9BzZIDR7y029uWHH8qzw8O7HDD27hbMXNiTsOQHkJvXW2gC218NN
 zP3LT3BhlhUl/BYEr9ZLZrJnqIe209PrxEotarQhoPTVOcOFo6guwtnDEb8m3JMNl0Fbhcd6KRCcE
 uf8VZrMg==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijzb-00E8au-25; Mon, 17 May 2021 20:37:36 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so297740wmf.1; 
 Mon, 17 May 2021 13:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+YZN/nHJaoReN5vhe533pLv6vKy4vqgUNAkyLEs9sLo=;
 b=jjenZUqlCFz/sLLao6aG/itHV1VYOXxPhhc7xgDn6CX7UYKhbwzM730BGr+DKogXVi
 nVUR5DrJG2P8I7jnUEz4sfy5Xj/RKiKhjzgCVWVsgRR3BgYZGtlkLcU9KM7oqsghabYn
 2uNGzBUUXHVkw14oyw6EwBZFG42oy7VgqkZ6BJMSmrfY974jFcoTMah8TDycfhiispfc
 cbGDPiT5PoE5toQprnMBu8NBI3Hy6XvBque87467+VIzZ45zmLqRXIk3byBZed9zhMJf
 yNsD7MdX2ocZYEvPoh/xGtE5B5NHtkp3OXu8a7yIqBL4CImTgaWpbxkHTsOZJJJ4Qs3q
 Ke9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+YZN/nHJaoReN5vhe533pLv6vKy4vqgUNAkyLEs9sLo=;
 b=lhXGdSkAGqczzu7tohpWx2mKJqxuqKrx0LraChjmMfkuA7d+EdeMI7kPNU9UbXrbWE
 9N9zWNYUGwtEvAmEiXUHQJUMlyTnwp7csHEy4VsA92c0MRtzaJE7n5isVRc7dB9V34sP
 mxStVh5Z08EkJLD2TvMTwDAW6KMSADO1NhGArGOS7wByhlLAYRHSSRjzAsWi2Em8D3Cz
 /JU8LvHjTiJbM+Bbm4RTABP438q5lXJN01N+TBZj5qR6Q2OpYAp8wOUocf/cxD1mHIiR
 mjDg4rDVV1+kDxsp/rrVtQj+4F0OEWJcnoyfNYXPAZtie6hNNmeGGS+lAUM7bny1e8bY
 1lwA==
X-Gm-Message-State: AOAM533ZZDrI+8+rze5f4HFiqrmIkT902n4OXHZutPrkM3JRWPpfwJUx
 7epRdmqykXG6KBta1wWA+FwMCphJaak=
X-Google-Smtp-Source: ABdhPJy6FKIWz8G7P++u7Qjzv7lGUSLH6Lp6ETi9oO7cHcCRGve9UsOhcCp/PIlvDnjG3uwp9T9BiA==
X-Received: by 2002:a05:600c:354b:: with SMTP id
 i11mr1360944wmq.102.1621283853624; 
 Mon, 17 May 2021 13:37:33 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371adf00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371a:df00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id p6sm3840448wma.4.2021.05.17.13.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 13:37:33 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: mturquette@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
 jbrunet@baylibre.com, linux-clk@vger.kernel.org
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v1 0/3] clk: meson: rounding for fast clocks on 32-bit SoCs
Date: Mon, 17 May 2021 22:37:21 +0200
Message-Id: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_133735_124756_A9B6ECC6 
X-CRM114-Status: GOOD (  11.59  )
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

On the 32-bit Amlogic Meson8/8b/8m2 SoCs we run into a problem with the
fast HDMI PLL and it's OD (post-dividers). This clock tree can run at
up to approx. 3GHz.
This however causes a problem, because these rates require BIT(31) to
be usable. Unfortunately this is not the case with clk_ops.round_rate
on 32-bit systems. BIT(31) is reserved for the sign (+ or -).

clk_ops.determine_rate does not suffer from this limitation. It uses
an int to signal any errors and can then take all availble 32 bits for
the clock rate.

I am sending this as RFC to start a discussion whether:
- this is a good way to solve it?
- what are the alternatives?
- getting some feedback on areas that need to be improved


As always: any feedback is welcome!


Thank you!
Martin


Martin Blumenstingl (3):
  clk: divider: Add re-usable determine_rate implementations
  clk: meson: regmap: switch to determine_rate for the dividers
  clk: meson: pll: switch to determine_rate for the PLL ops

 drivers/clk/clk-divider.c      | 39 +++++++++++++++++++++++++++++++++-
 drivers/clk/meson/clk-pll.c    | 26 +++++++++++++----------
 drivers/clk/meson/clk-regmap.c | 19 ++++++++---------
 include/linux/clk-provider.h   |  6 ++++++
 4 files changed, 68 insertions(+), 22 deletions(-)

-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
