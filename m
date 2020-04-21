Return-Path: <SRS0=oV4S=6F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E90C2BA19
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 08:17:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D1942073A
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 08:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n8M/YPlE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AF2Bq+4R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D1942073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=jt+/GTdHxNhlYr7754cYiWQvKFtSnev8Z4LTdQwyPEc=; b=n8M
	/YPlEJ/3zAm9NqBdNPT3PNGNKq6JLSus/9SjcsWm8zUULbQvucc7xhs3i7q54xPmU9iiW5FO4pA8B
	ZadobRqEKM6Ozht4kG0caxIjYR+RclH5LSae25nSkZIL9P5Oni59hgl3bgYZpv7BG8EMChUtM+M8f
	d0FkzG5wiDRwoE4AiaW460y8Xpdr2XFSzIw7vIPs7g/TyXjn+Rz+XIMeuBpd0c3GSv6IqY2ZXWnBC
	GOmL2WdUcLyBR8Ngd6xgH8pM/BI4/kgkGD0JxrUo85hLQuVCfnR2U3dSe9UZgofwvy/6ZtiSKUxjF
	DJJAVx8EG/oTWCdnlV6aooglWT8W2tQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQo5f-00078M-MR; Tue, 21 Apr 2020 08:17:11 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQo5Y-00076O-4P
 for linux-amlogic@lists.infradead.org; Tue, 21 Apr 2020 08:17:05 +0000
Received: by mail-lf1-x142.google.com with SMTP id u10so10369632lfo.8
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Apr 2020 01:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=qT6ZuW6H/bnC0x2akJVYOmPBEwGD1w226p2Ed4JIQpY=;
 b=AF2Bq+4RAAP4WwoRGv/PR1dn+BAuzSTFEF6LzSDAGRUrCi3ltVZYsG1uiu7zd/hJXC
 GsgA7LO5qwLX3p3K+o1oVh+icpp17xlDZjTpJNn3u/YOKFEAFXpMg5IjgV0BnXNvgyuE
 wtj1Mp+yUHY9D1XoEz71AYzt0sBK359lNMjKuMovVGgH+w1BloTUppaPZh0hxXAzfpHQ
 vDIogZb9urCK2/wI6kiF2nmG3l/IcVa440rYNFUfmkXaMjc7nH8ZAEQIev3mbiwFuaiZ
 RJ7dvVMNG4+7IIxBxjEM3M93bIbSyRngBwD9oGj8uLX0Ps8wliLXhwbcUAjJhO41rtmn
 Yy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=qT6ZuW6H/bnC0x2akJVYOmPBEwGD1w226p2Ed4JIQpY=;
 b=kjZP0NFZJoAAMEnL065NI9dwj/spk5Jf9HOcQlJdf1QRu/IZzSabm1lb+GLx/UGy2k
 CqrJWKWVvKBwUZl6tXy6mYGVIUIHsIOffyeMmYJ9p4nLZ16TyM8r/stui7CG3uf43E/Z
 1L3ihpZFqQmnxpVWG9Mm2+1bkv3ALQ/BCzh/fSCTqsCNOu+3oMPfUarPTLj3yJvnPw09
 SNswxjrMylQwY+baaqdcMw3Yj19SN0V+t5L9+OnoDDV3VqbSkFeu9UtZK7ecDAqfqQWG
 TFqhP+tqDSnYhevdY1NcKtZCssl4Lruk55KnAMSR03J6JIE41MZHu0sp9z4HCAD8p8yk
 jK6Q==
X-Gm-Message-State: AGi0Puay42YYY27k/TE4AlZn6hHS7cz3VhDxg0isTxBNXvUOT171Ojvq
 NoWualJc27w57suEn7LBvWo=
X-Google-Smtp-Source: APiQypKq4AOwfvIZ5pwMIp42g2Uj+koYCzjJQvLizQWfRXcE/GewHXtfQVut7+0QWFlf1wUK+jKTcw==
X-Received: by 2002:ac2:41d9:: with SMTP id d25mr13158140lfi.204.1587457022307; 
 Tue, 21 Apr 2020 01:17:02 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id j13sm1472756lfb.19.2020.04.21.01.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 01:17:01 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Bluetooth: hci_qca: add support for QCA9377
Date: Tue, 21 Apr 2020 08:16:53 +0000
Message-Id: <20200421081656.9067-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_011704_178644_469A8E86 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 chewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: chewitt <christianshewitt@gmail.com>

This series adds a new compatible for the QCA9377 BT device that is found
in many Android TV box devices, makes minor changes to allow max-speed
values for the device to be read from device-tree, and updates bindings
to reflect those changes.

Christian Hewitt (3):
  dt-bindings: net: bluetooth: Add device tree bindings for QCA9377
  Bluetooth: hci_qca: add compatible for QCA9377
  Bluetooth: hci_qca: allow max-speed to be set for QCA9377 devices

 .../bindings/net/qualcomm-bluetooth.txt         |  5 +++++
 drivers/bluetooth/hci_qca.c                     | 17 ++++++++++-------
 2 files changed, 15 insertions(+), 7 deletions(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
