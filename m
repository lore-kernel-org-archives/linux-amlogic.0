Return-Path: <SRS0=FRsS=6H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03E6C5518E
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2020 01:34:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5F982074F
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2020 01:34:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dPVa2G3y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdTGzAGk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5F982074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tLDnkInLMYhqBg5UbkDU76ayp5XRog7jQt0YY61t7aQ=; b=dPVa2G3yvol/hgh8g3AJVDRa8h
	PywdRCbDUBOxxqyVkqSVfWwM/lHJFxtobm/eK8o/JlWktbyzOg86faVdKoJ/IDRcczidSOzOlKyED
	pOE34Lqlg7yUVfrPnQ3S5JFKV4Ww3qRyN+AGGhyS3rGti9qb77AdRi2RZF75cRd/4EvGPrGt42NjX
	xXCZfMYPq0aIgmYNmzx9vrgjWgc+NbE+McqXm5JOGD4hgWdMAu8oG0A6BvY8XoCEJMTFe1NR/Fldh
	ZfBBmHN5ThI+J3puASMKXEB8D0b5kpCf08+IT8gxkTEoC7wAqJglAzXgRABHrmIvIew6kFd2vHMuq
	aKpoYZ6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRQlH-00077q-6d; Thu, 23 Apr 2020 01:34:43 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRQlE-00075B-Ja
 for linux-amlogic@lists.infradead.org; Thu, 23 Apr 2020 01:34:41 +0000
Received: by mail-lf1-x143.google.com with SMTP id w145so3408827lff.3
 for <linux-amlogic@lists.infradead.org>; Wed, 22 Apr 2020 18:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DsCsLkML8vM9o9JxjC1JcTLr6rGiyK9/YPUi2mV+hHw=;
 b=YdTGzAGkjEBzcnx49rbGvNS1WOd+XJ8J9lgxA6IPs6gu4S+tg+tEYFwjVKgcUBvoHk
 1oLNnIxmP+G/Y1fJpSkLvUMj2QrhyORezRtkJK1lMolyNl5JPHwZ0FleA8o+BEyGTdOY
 WRfjsvdnGxSG52uUlmxNtGJe+szGQUWDuM/B9Tm2/z74WET6j/GRGi/yKWcwI7rCm6TZ
 8O1Ygk3E09cp+lbJ4Z+hmQ2iKyYbnXlSmwvU8TJ5/h/IKM3Q/A7DSnXqVf47EiWcyclT
 GeUvUyk6s50zwP5+lWTAkN3CTA51O890tDWZbj7r/+W1iau8gF7W9s6u8uS8vz+lvjw2
 aRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DsCsLkML8vM9o9JxjC1JcTLr6rGiyK9/YPUi2mV+hHw=;
 b=pjb+Z8rNtbNjhXlHoQ0pf2+qgNpilYdrRW1QMSeE7jkQnbFyguEzReFeumLER+wdAr
 DM3vikHuYNS5EKaqdVax8JRoVGDnRL6UQ0bzUOdqzr4gnfNuJ490cZqUQvbSMoqc4aUH
 77vXbbcTkmnkb8hbMX/5QnmxYO/SWdNsnl/0+Rvfzsmrgle9qLCVCoHf3FHgq7gwNe3U
 GnEmDrHj3jIl5waFrIgsC0UjcrORYPErzx4W4Bf0behIb+h6b3YEqaUFvZk4NAbFTG6a
 /EnvxDJnZS06URaSO8kEgW6WJi0EFEfs7xlMYjC0jf7fzCkibKAdsarBy5yeen9wESQP
 Ozvw==
X-Gm-Message-State: AGi0PuZFWMk4Nr97UxtouxeRPKthU8wu0dmWcnw3AHIdQLeP/owNzwRV
 tSIVnOJW97vZ/ci/0ZW+Exs=
X-Google-Smtp-Source: APiQypKpOxCqGo2vEH5cRAwTfl60WT+Lj+sRkrcgjF4/zfgt2tmFvQw3sVSr9hLuEXo/Vw1v+NKg9A==
X-Received: by 2002:a19:5f04:: with SMTP id t4mr825926lfb.208.1587605678890;
 Wed, 22 Apr 2020 18:34:38 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id h21sm564967lfp.1.2020.04.22.18.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 18:34:38 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: net: bluetooth: Add device tree bindings
 for QCA9377
Date: Thu, 23 Apr 2020 01:34:28 +0000
Message-Id: <20200423013430.21399-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200423013430.21399-1-christianshewitt@gmail.com>
References: <20200423013430.21399-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_183440_639826_AA4968D3 
X-CRM114-Status: UNSURE (   8.08  )
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
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

QCA9377 is a QCA ROME device frequently found in Android TV boxes.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
index aad2632c6443..709ca6d51650 100644
--- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
@@ -10,6 +10,7 @@ device the slave device is attached to.
 Required properties:
  - compatible: should contain one of the following:
    * "qcom,qca6174-bt"
+   * "qcom,qca9377-bt"
    * "qcom,wcn3990-bt"
    * "qcom,wcn3991-bt"
    * "qcom,wcn3998-bt"
@@ -21,6 +22,10 @@ Optional properties for compatible string qcom,qca6174-bt:
  - clocks: clock provided to the controller (SUSCLK_32KHZ)
  - firmware-name: specify the name of nvm firmware to load
 
+Optional properties for compatible string qcom,qca9377-bt:
+
+ - max-speed: see Documentation/devicetree/bindings/serial/serial.yaml
+
 Required properties for compatible string qcom,wcn399x-bt:
 
  - vddio-supply: VDD_IO supply regulator handle.
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
