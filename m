Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D9FC5DF81
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Aug 2026 11:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XLKa/kE1azcusJSwmaCAdOaI1b1O+u2aS/w8wSuilYo=; b=rCfabwjTiYUoSU
	eUOQsAb+0HE7HUCOYpYYNaWIuq8w9hMMUjrE0k3IhVCvS53mvuU6fwfEw4u0t6mcarpeeYuixg/A1
	OJQ4lDUrsuNjohZ5/UdZjYMft+SgJmQThP+TPCmw/y+lJYl52REjqZHq7WcOOmRsfAWridPHzIQZ4
	Wop0RouxOGa52Cx1VdQxgfvJPr2rQp3xADBfoJ0Ae4wPUqcPAsxyFLvrcY8Xu7oBtnRPBiUgKdwW/
	rU8A8uJV4vtAKPNaBZPfvQ0wUcLTPE0N6w7hgd0KF5vh24e75VgbcyvqhrORevwQhpdYSzzhpPiBC
	C6DIzas83IOwxWeMz68Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6lv-0000000FJS0-0fB8;
	Sun, 23 Aug 2026 11:53:55 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6ls-0000000FJPq-0l8Q
	for linux-amlogic@lists.infradead.org;
	Sun, 23 Aug 2026 11:53:53 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-495590dde14so20667105e9.0
        for <linux-amlogic@lists.infradead.org>; Sun, 23 Aug 2026 04:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787486030; x=1788090830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJkLdfWqS4G1xdqUVtL2U3xbkMZdjpzIyL7R/rtgSKY=;
        b=ZC9UVnw49mu2bth3NfJWqyBfUOW0q3zEi489lg5LXAmHz09qlUvKy7euaL0zgpwqh6
         OfcyxnIAfF5RL4kL+ke9gSO9ol5xSNnOyu4W2MXXA/fWOx+HSpRyLxuZGElzkoEW3shF
         ncqoRAW3DTf18UjRcyRq7/svWLhx2RItn3twgimwq/IVaCIEjx73PVUiWGtTsxXYJM8p
         /kHQeyH5NTd3boeUnm+bpPqShLYM5dwRrRFXBzTlQkGGh20DZJ1/Ekpf6TQcEfEdY9/e
         Py/CyBX+O+wwGVmrgEStQjgKphj4M3LO/UNSarRqHNe66WvwdwMsrz9VyJ1Wni1cvwMT
         x3Ng==
X-Forwarded-Encrypted: i=1; AHgh+RqIbrVT8PEXg4rRJywzaXHESdpRcmZ1ZmwDrbpmX8OWSLmpjlzBj3WH34dsswmxP/NuVroFXIqXWqfRpxLZ@lists.infradead.org
X-Gm-Message-State: AFuF++n0MlJ5NJi+uVgIKO1F7YfyLCFTzTODiiYbLZ6uNh+byho5ptm3
	GSL34NXeh0lLQqblKLgUPCDuC7haOtCO6UMRRkq63banQVPtuVVIFm2H
X-Gm-Gg: AR+sD10e5WMF+XMnu9VharngV0L9M0UDsI62IBkxOo5lWQsWtBO/hEG22KW0SEg6PYL
	JpxkG6oJ1axWloCClmn8+Wal4j2a/mExM6HRMgi0ZlhqyQILNkFvKtjL1OmUi6MCueZe3OdyPis
	bt5GzBf96wi/PADjMNXV0iktj35vSIw9HhgcNKw4aIpH9TlgmntOIrCq20LCphGdp+ML/btD5db
	J9p0sxoJ+DwLS2tKH3REWLSErnYc8zrIrHQ3TjQ41eucHVrlQWzFjIkiYuySdPXL14PJV+M9ViO
	Suh3Tx4N5oBwSmIV6Gd9N3rWifWld6jdy90otWZqWDcXB+KnjnnEIbX+Sgl4BD35rpkchS4Tbu/
	WuSmf5Zgn/jme8r+mXwKhP3pZwY4KyqGxfh89GP80tp2/w/vm4a4stkA3wmqEhuuxBWeByhPMNp
	cTGZAZ+Mev8WtEZXGTN4a29MqQJQKxQ9NOhRc0Wie6GrPopg4uXdAq5AOYHFitXzL+PaVN8dHRG
	9WltL2hojDp7SmmpMMfb8MTqGym0w99yMfbxg==
X-Received: by 2002:a05:600c:c08f:b0:499:be9e:49c8 with SMTP id 5b1f17b1804b1-499be9e4a32mr134720045e9.13.1787486030111;
        Sun, 23 Aug 2026 04:53:50 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c355e1ddsm48680935e9.5.2026.08.23.04.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:53:49 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: amlogic: t7: fix UART clock and SD card recovery
Date: Sun, 23 Aug 2026 12:53:33 +0100
Message-ID: <20260823115335.102219-1-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_045352_218125_D29F974E 
X-CRM114-Status: GOOD (  11.82  )
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

Two fixes found while booting mainline on a Khadas VIM4.

The first one wires uart_a to the real UART bus clock. It was pointed at
the 24MHz crystal as a placeholder, because the T7 clock controller
driver did not exist when these boards were added. That leaves the real
clock without a user, so the kernel turns it off when it disables unused
clocks at the end of boot, and the board hangs with the console gone.

The second one drops regulator-always-on from the SD card supply. A card
that refuses the 1.8V UHS switch can only be recovered by removing its
power, which that property prevents, so the card never initialises and
the MMC core retries forever.

Both were tested on a Khadas VIM4 booting v7.2 from the SD card.

Changes in v2:
- Update UART clocks directly in the board DTS files instead of moving them
   to amlogic-t7.dtsi, as &xtal is defined at the board level.

Lucas Tanure (2):
  arm64: dts: amlogic: t7: use the real UART pclk
  arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power
    cycled

 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 +-
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
