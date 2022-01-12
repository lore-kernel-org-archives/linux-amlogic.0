Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DE3C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 08:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3fQHj9XurPUxzNEh2nh8Ge6djs2ppRsyGSOOeyj+Gg=; b=ldKdluBoR8cBJQ
	GBlij58olrFittC9UXZRMtdJD+KHUmX3EtNjNZTgWR02RSjo/A3Et9eyCQvIqWfHzFaHGcRSiK0n5
	NLEy3PWK8Tn2G6JZ19iKN+3txyHiVXMVjXPRZZSVm5EQtof5D7ElveZqyIo82MeM91gRNMMoCEyyq
	ZnhTY/1mfDDdtdmsqZcaOdXVCeQ0OERnLswCdPjn38yYTV1A/6ToJSu8MQqv69r4mLP+gAKNu44ZW
	YJPbRRNxkgARk9zWTUUQdeD3fHTo7iEUc+GOxAo8AQH3XzodUd1LOkvigiaC4FWR4onCnXs2aTlHu
	j1obftRnrlytqBz3tOSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Yzz-001WRx-TJ; Wed, 12 Jan 2022 08:28:51 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Yzf-001WK0-Ms
 for linux-amlogic@lists.infradead.org; Wed, 12 Jan 2022 08:28:33 +0000
Received: by mail-wr1-x42f.google.com with SMTP id l25so2675881wrb.13
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Jan 2022 00:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FKtDyNYer2rw6Zv9E7QWadmZIxE7oXLzSiDYp94iL9k=;
 b=N3oTYWmb+v9cGuBIeWCILWZcj+nVimwmYD78hO4muTLMz+5RQ2gA8bAcjU3/RX72Cb
 lOmadz2T2tEDgcQhmMNI/rIZTUtBfCf0j+wFou9FkYkHrwPTuuhToz3/+H6u3IPWz2nw
 uF/EyQJS8xt5e8fGyddIDYul+WM4sFc7bJRdD4rBhDUKdV4BT/mu5A6ZtAlZ5fwcmWH2
 YUe4JGwo5LDRWKOhkHKgW0aJ+uoTlpLcVwUAZ6KELe30PhKQX9438FmOfRDwVfwQX0qG
 OjgmZ+91hjQZRl3q5dV4L5y9JW5kIPzU2aitFcJo4bYyNgtvbtABvsOtY67tS0Vy1XaG
 vSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FKtDyNYer2rw6Zv9E7QWadmZIxE7oXLzSiDYp94iL9k=;
 b=T7DcFBPJSkjQQDNSAwAiZ9Cfhy4o1/1hKHqK59iqZFcWlJJKpIBlc25kGnnej/30BZ
 a306AFZDExwhEPtyYeyKKqPitCW4MnwDNaMFitmbAUYs8HaChxEGGQUXxNxWIQSGZXx7
 fkbdgO/2ZljUgdHoRpiKnXJKJaILd9Dcz5GtnyzU4N4hsvttNMT6JxQ0c85fGhImpwQl
 8KIBUShJBazCSKRsjal/mM45+OnxlBCKeyEs281KvA8hsZyIN/jvk8+Emelwp0IFD0Ow
 1D/2WMZMF/5NYmdmygsCLXnalCJ6lfiut/mog9/0piFkuFunzP25NjPJmEA7i2dpVUo/
 w4Tg==
X-Gm-Message-State: AOAM533xbU0NFOKh4GtvYG7kfzFqSpRrq8vkS7DZscIAgJFZconnUZK0
 nopQ1wiRNnBCV0z/fhRbbh1hyw==
X-Google-Smtp-Source: ABdhPJy5DHSJBcGXXU6KEF3PtRXYTJdsZ9LtzeYqX4zs5f3GcuDPV1oA+K5gXJ8cpzwkh7xaQgViHg==
X-Received: by 2002:a05:6000:1a8a:: with SMTP id
 f10mr7085427wry.246.1641976106700; 
 Wed, 12 Jan 2022 00:28:26 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:381b:6e50:a892:5269])
 by smtp.gmail.com with ESMTPSA id v129sm254846wme.29.2022.01.12.00.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 00:28:26 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: Re: [PATCH v3 0/9] arm64: dts: meson: add support for ac2xx devices
Date: Wed, 12 Jan 2022 09:28:22 +0100
Message-Id: <164197609474.825600.7106897196640617717.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220112022713.25962-1-christianshewitt@gmail.com>
References: <20220112022713.25962-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_002831_773707_254D143F 
X-CRM114-Status: GOOD (  12.42  )
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

On Wed, 12 Jan 2022 02:27:04 +0000, Christian Hewitt wrote:
> This series adds support for several popular Amlogic S905X3 (SM1) Android
> Set-Top Box devices. Like most Android box devices, they ship in variants
> with multiple RAM, eMMC, WiFi and BT configurations. RAM and eMMC are not
> something we need to consider to get a working boot, but we do need to get
> the correct connectivity spec. Broadly speaking we see boxes with Higher
> and Lower spec connectivity; High spec is Gigabit Ethernet and Faster dual
> antennna WiFi, and Lower spec is Megabit Ethernet and a single antenna. In
> some low-end boxes BT is omitted.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.18/dt64)

[1/9] arm64: dts: meson: add common SM1 ac2xx dtsi
      https://git.kernel.org/amlogic/c/b5a03ecec30c1a71d51de3e73a2e7ab23c3ddeb6
[2/9] dt-bindings: arm: amlogic: add X96-AIR bindings
      https://git.kernel.org/amlogic/c/d2ecf5ae59c8eef9fe2ad20d83977c2889646d4c
[3/9] arm64: dts: meson: add initial device-trees for X96-AIR
      https://git.kernel.org/amlogic/c/37875d9dcb42d489ba28518b50fed0b2ba768b03
[4/9] dt-bindings: vendor-prefixes: add cyx prefix
      https://git.kernel.org/amlogic/c/3dbabb9ac746ab01c71aa019c58a2e0cc6eafe1c
[5/9] dt-bindings: arm: amlogic: add A95XF3-AIR bindings
      https://git.kernel.org/amlogic/c/bc7811bd4e884bbc21cc7b7031cb7c297662db9c
[6/9] arm64: dts: meson: add initial device-trees for A95XF3-AIR
      https://git.kernel.org/amlogic/c/8b749a0205bd41cafae37e878fd4a1b57b7b24f3
[7/9] dt-bindings: vendor-prefixes: add haochuangyi prefix
      https://git.kernel.org/amlogic/c/bf510ace20ac153946d6d0ab6305dd8aa52eec6c
[8/9] dt-bindings: arm: amlogic: add H96-Max bindings
      https://git.kernel.org/amlogic/c/2ca889b1201625d36efcd51d25371d937a6a0b8f
[9/9] arm64: dts: meson: add initial device-tree for H96-Max
      https://git.kernel.org/amlogic/c/ac7b4433714a37e2c4b61acc6ce9b4538175e836

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
