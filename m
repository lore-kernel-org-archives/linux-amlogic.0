Return-Path: <SRS0=Jm29=LI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412BFC48BE6
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 08:00:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04CB861352
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 08:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04CB861352
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhFJtUNiYm06JCXtiUKviqA3PRWOEt1RhUaunG8gjOA=; b=jewgukIzAfox/Y
	Ji85dq92rGR+gwRYfa5WQaliwUdzalWrxZl32ppqteplADiHQ1hfBMjQ7NOk6a8b5rGJXXEvAjpit
	CmL4TKTft7ZCUqHLliISsLmePPwlVpjCfENTxdrHANQdYBOXEkXrJQTCbMwvgKu7M7EZgefnoAhRj
	7C1EaUpCcu/OXhSVxiDdOOE+mMaqLMie+U1WHWWWYSPVLjBWApBIAPTuvpAJroIHyQgC3GXlGmFMf
	HycYkdE2a1KiwR71W1jonUmKPVdzeaBRRBAH7R9+nO2OFhjjgmNXlR5P2kwMdJXmzvjcbbUef6TkB
	/eyMOlrOVrW6sxH8LFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lshWV-00D1gx-Jg; Mon, 14 Jun 2021 08:00:43 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lshWE-00D1cj-9f
 for linux-amlogic@lists.infradead.org; Mon, 14 Jun 2021 08:00:27 +0000
Received: by mail-wm1-f44.google.com with SMTP id l9so11554037wms.1
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jun 2021 01:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5tuJ1U1oQdCxdR2Ogc8v5z1mBF2S7N+I6jU2dYfmsAs=;
 b=SFODf6ZXNO7NVTz9A/PT4aQ8DER+BqnRCMFHsjd4EcESRIwT2uBLqmree0Ng3Sa+Mn
 A6P9gtvu+DIKXWOCT4IBtl+14Eh1hli0TWsW/3qogSj661gg9Zn+GNevOeZNMfGlJGOa
 loxQflUlnoQMwnZr7DAw1gkClDh8ofpZxczDBaymOvpEt5Q0D4hDD8Ghl5Q3J9OSeVD7
 Wiej2JAvn73KytGDg3ZLDt5c75aGdAUOFu7OLo82NFhjn6nzkGpQOzBBqL5KbeeLH7Xr
 9nvCAL+0wlt9TUmF/FJMUA3LM7ie/FLZwxZYGqOrKzAKAou5SMEa7gP4oboj0LKs9EN7
 yBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5tuJ1U1oQdCxdR2Ogc8v5z1mBF2S7N+I6jU2dYfmsAs=;
 b=CBIOS3UifbKnwyy2ie6DXgmQIA+E/97Sd3/cMp9MsbkJkEuJJzY+t2BdfuY9lYqbe4
 pJ3twpLxFjBbUbDNGgG8gKrmQBN3Ge2dAyqAnO75mdnfKOOGTXxI6+X9FYmCwGsXiv5R
 MJ1nVYX6DqC0jUGtl8mUSAlLxiXzdoUNmA6tzX7IWDQSnvC9sjdE1srPyrL3dguTBKbF
 6WnYkLLPryKJpklOHVOG2EpMz6IaxvmhwfAbY6aqWmvH7y+YuI5Fv/dXLdBozmLLZJeZ
 uMa9snEFaCYPg6ymTamT2in7Vk9hN4GNPNuml9JIbdFrXoLS/CQpzBe+rl4CLYOYMwZu
 vTCw==
X-Gm-Message-State: AOAM531Fee/XW1iaCDicfORGHtVZLVVUIKQupxsf+M18I5lC2x6PB73Y
 x1ytqbBHSKGSaPG/kOKr+ItxPg==
X-Google-Smtp-Source: ABdhPJxKRlOiE2KNA9Lj3LnL/AwzcvgTcnLne2X4hj3ipqSMjinzGRafcG66LKKN8dmGKCPQrzoxEg==
X-Received: by 2002:a05:600c:354f:: with SMTP id
 i15mr30142407wmq.131.1623657564356; 
 Mon, 14 Jun 2021 00:59:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:71f0:4862:1742:37fd])
 by smtp.gmail.com with ESMTPSA id
 b8sm19968466wmd.35.2021.06.14.00.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 00:59:23 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 jbrunet@baylibre.com
Cc: tobetter@gmail.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/7] arm64: dts: meson-sm1-odroid: various fixes for
 C4/HC4
Date: Mon, 14 Jun 2021 09:59:21 +0200
Message-Id: <162365755420.29993.17717376637508529981.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607065435.577334-1-narmstrong@baylibre.com>
References: <20210607065435.577334-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_010026_347689_C2C9843F 
X-CRM114-Status: GOOD (  10.57  )
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

On Mon, 7 Jun 2021 08:54:28 +0200, Neil Armstrong wrote:
> Here is a collection of fixes/small additions to Odroid-C4 & Odroid-HC4 concerning
> regulators handling, USB and SPI NOR Flash of HC4.
> 
> Changes from v1 at [1]:
> - added review tags from martin
> - removed invalid patch about hub_5v
> - added proper vcc_5v gpio control
> - removed invalid hub_5v regulator already controlled by a gpio hog
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.14/dt64)

[1/7] arm64: dts: meson-sm1-odroid: add missing enable gpio and supply for tf_io regulator
      https://git.kernel.org/amlogic/c/1f80a5cf74a60997b92d2cde772edec093bec4d9
[2/7] arm64: dts: meson-sm1-odroid: set tf_io regulator gpio as open source
      https://git.kernel.org/amlogic/c/7881df51368027b2d3fed3dcd43b480f45157d81
[3/7] arm64: dts: meson-sm1-odroid: add 5v regulator gpio
      https://git.kernel.org/amlogic/c/45d736ab17b44257e15e75e0dba364139fdb0983
[4/7] arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0
      https://git.kernel.org/amlogic/c/703e84d6615a4a95fb504c8f2e4c9426b86f3930
[5/7] arm64: dts: meson-sm1-odroid-hc4: add regulators controlled by GPIOH_8
      https://git.kernel.org/amlogic/c/164147f094ec5d0fc2c2098a888f4b50cf3096a7
[6/7] arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4
      https://git.kernel.org/amlogic/c/7178f340e9299dc886e6ddf6e938f09967902109
[7/7] arm64: dts: meson-sm1-odroid-c4: remove invalid hub_5v regulator
      https://git.kernel.org/amlogic/c/303d2af21aedeaebe824411fbff912dfcdb48de5

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
