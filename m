Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F005C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Feb 2022 11:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T81sLqAwntXEer6qEguYXjfH3bfAGN3o9TfHOmGnJGI=; b=DUuPue7Yis46Ox
	XzqrRmVw30ujmriopWMQouDbBB/yr/quYpmjltzbS7WUl0Gg/ObLC2C2OeIjSZq+Tp9Fk4AVd7Xhx
	x7bNECyCGskDiKpqgXjk+HdPd6pG4pufPwSabXg6fn03Q5z14Y5XRyjVuWfisqj7IBzlUsykC2mrY
	gM/b+DxZsEfkbzMPs65FZE9WmDDK6FDQqH1oSrCH9mUivmW8B9I9WvOnAnj7ytzz9R7L+6LItvnHR
	EEw8lD06bD8scgicqVk2+ph9po/Gn66MizxT/+HDG1Xt5rbwEBr9cAK8mBVoxEuaxs2Pau6qg/bC1
	zcI1W1R93CantF+e8u7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nITg7-006m9V-BM; Fri, 11 Feb 2022 11:01:27 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nITYF-006iCO-4y; Fri, 11 Feb 2022 10:53:21 +0000
Received: by mail-wr1-x435.google.com with SMTP id i14so14467775wrc.10;
 Fri, 11 Feb 2022 02:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=of3le3k/KcLzclFf7nJv6f4XfC/usK0Ju0claWmnEME=;
 b=GZ7csHpJQWS+7GE0vCWAKb1M6ZTyGqs+BBFyESHjeloc00rNm75VLj2Vr5sLW4zOgJ
 IPca/d27X0xAYVzJYIZ1kiOP6u45c9SNks4KwWBNwGE45FA8gymJBkSOJwh5fM1hgC0i
 jFhWzRi9MjrVlkx5v0RWTbsKybcfuO1HynN7kWFDJ/Lff5pgcO+FrKIl1tmY8LeCyIYl
 tNUOLa5SBzTAc2LJKz1420XCJ+c60X8lFhRSPllfsuAqBlEDkbKTclNCgmnFcnGPTtS2
 1iY63pArgoOHRG/TqjMIUgdbn3+Woclo1hwmfLY6kL8CZMkJj7UJ6wxGhp07DVb9Q5sm
 hnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=of3le3k/KcLzclFf7nJv6f4XfC/usK0Ju0claWmnEME=;
 b=P/Os7YxEQRU+sPU8yju6Wfec6S/SafDUT2zmepsO0ZQlkUyzmq+pTI3QBzAWSO/LIQ
 FDZn21Zal11oRP3KZV3HPUZ+UxUif3NU88ZXcQoia0wnGCAEKdWCVvHVMk50WZzIrIlM
 7kazm5K7ddHKl6ZKfoGBN2VbBhWSbgHN624BPXFX27WL+JqPC1nemtu+183Uex0TK/KB
 WQ64rSgkz3oT7G7iBFX3RJB/Hwu9JUsk9ihoc0PG62YpDQZWClF0bzTnxDB4WnjZEJRT
 m0xbk8hMti9iDef1RQTGxSj6+9mqj3S1Hj5zf0iR+n8qdSYiqnJ1JQLJnTNcpfCSGbuO
 lMgw==
X-Gm-Message-State: AOAM530hdE42ZpcLKcLo6D2bzXJxNYd/UKTiQTf3kcp8wOh/S3QWqIEC
 0zWjXrEQfgIL7dT+JSnrQDE=
X-Google-Smtp-Source: ABdhPJwBV4hMhVs8zqK+aOVwlnMeYFKAdAUfTzKutsCN8IPhNiw/tqsDIIIgxzG4C7agGJo/SxrmzA==
X-Received: by 2002:adf:dd8a:: with SMTP id x10mr925672wrl.422.1644576796556; 
 Fri, 11 Feb 2022 02:53:16 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id b4sm13382374wrw.100.2022.02.11.02.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 02:53:15 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Sam Nazarko <email@samnazarko.co.uk>, Chad Wagner <wagnerch42@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: meson: add support for OSMC Vero 4K+
Date: Fri, 11 Feb 2022 10:53:08 +0000
Message-Id: <20220211105311.30320-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_025319_258049_3D12A361 
X-CRM114-Status: GOOD (  11.56  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series adds support for the OSMC Vero 4K+ Set-Top Box device
based on the Amlogic GXL (S905D) chipset. The Vero 4k+ is notable
for being an original Linux (not Android) STB device, running its
own Debian-derived 'OSMC' distro. Big thanks to Chad Wagner for his
help with testing and device-tree fettling.

Changes since v1:
- Address device-tree comments from Neil
- Add Neil's reviewed-by to patch 3

Christian Hewitt (3):
  dt-bindings: vendor-prefixes: add osmc prefix
  dt-bindings: arm: amlogic: add Vero 4K+ bindings
  arm64: dts: meson: add support for OSMC Vero 4K+

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-gxl-s905d-vero4k-plus.dts   | 117 ++++++++++++++++++
 4 files changed, 121 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dts

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
