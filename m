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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B33DC55189
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2020 01:34:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6146620787
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2020 01:34:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T1kUkGAX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cm++pq9P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6146620787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/Xp42LwnetVQTJo1kP9bFr0L7eQoPuNnS/GnjRDxt5I=; b=T1kUkGAX9lzHxEaOyOE6UrMqj3
	7agZilT+J1ccSzPtaqYTnQMCbghYND6axt181xrEQh4AMTC0JChxRTiSSdRtqciikMyFrqCcAZ0Vs
	3gZt1GMKAOvM8b6/BZ/pPTUX/u7kvYblT75buKEAQ9sKew4CzWtXoyVBSuRff/BR9FELc7jRRZqQW
	hhBy47N8MWRIuP2UQAOdKBPzYz9E6CzxH58A+6HplQ8czgpWHtfGT1ocWwJ/aeoonnloU97uhu98M
	NjYZwGJGiqLobF8KWIe2hFFqT3TO60xaanno11o9eEtjYRilmjw6PZzu5GJG7GcgzjyEPTvJQl0W1
	j8LbuNsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRQlL-0007CF-9L; Thu, 23 Apr 2020 01:34:47 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRQlH-00077T-8Z
 for linux-amlogic@lists.infradead.org; Thu, 23 Apr 2020 01:34:44 +0000
Received: by mail-lf1-x142.google.com with SMTP id r17so3413633lff.2
 for <linux-amlogic@lists.infradead.org>; Wed, 22 Apr 2020 18:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SjIpWwjlKzcDo7C6DWuyOHHv+FcusMs+xC0Ay0zQfow=;
 b=cm++pq9PqU09LWqOhZICWe+XkH+rovOt0WcKcXhCkV68g2OLmySWEs8eAD81MSrcw/
 Sy8Kt5GeHkQT+OEui9SMm19xLNGepSRVK807WGewtLrKHE1zOSjA+s+KWiPo6EkRpPC1
 qUhtor3UpK+M0NTcMHR21oJ9SoAIPc4Giu2g7/xmzL+mLc30/RHTuIWT1h0de6xYI/JP
 ZeBqb3tEwDtOvrsXWJbL1tzttr9/QZtRVEdc7HGRFaNn9NuSUgLla1y+FuN5Si5WVqsX
 /0BYtRb8PYZOBVCZJ57YuqEYSVQzr6pDansJMBrdSYrQRVC2OCjdptHXIkAg2PIHg29a
 RBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SjIpWwjlKzcDo7C6DWuyOHHv+FcusMs+xC0Ay0zQfow=;
 b=mKewfSAnKIwDkdPvIWcpFAPwmimZZKJdxFl3KwLydrS9LveSWb8hXok1RS7wGscX2z
 afkZSbgGALwxpGMD7LEn/SAENbnEQ1ZvXHYB6ZrrVTQby2Ccgc6EKQ1u/0wtsnd5miQG
 aOBvDM4NSZbeevRwrmm6cSP41pTbGJtIGO+jD1NJpe3DnMXJkGe+jPr5qltyv8r112Lk
 1/Xy1HQR0+/2MlN1Kwh+06d/eBTCGMLcCNHcuDD42wNJGG3euUzk1xcYX0jw0jOZFjr5
 fQ/FJGJIV8CiyJIS1bI1y150kdUt5ZfT0UcYXjNyILZY5eo0vPTlvLIPC/BTpJHCIpTD
 BOfA==
X-Gm-Message-State: AGi0PuYGd6dIt71ulbKlsY5aSEEVytt+qxLK08rggM6MibhtcivuvHGr
 sYjoS3AFRBinBu8ba/7sQvI=
X-Google-Smtp-Source: APiQypIyfajWd1CR5VR7pjWZXmAEpBB85Z/O3xF0H/BMnaIMr+pEz7yjtjAH8cE9ZAsZJiENbSjegg==
X-Received: by 2002:a19:4f48:: with SMTP id a8mr815575lfk.174.1587605681743;
 Wed, 22 Apr 2020 18:34:41 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id h21sm564967lfp.1.2020.04.22.18.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 18:34:41 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] Bluetooth: hci_qca: add compatible for QCA9377
Date: Thu, 23 Apr 2020 01:34:29 +0000
Message-Id: <20200423013430.21399-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200423013430.21399-1-christianshewitt@gmail.com>
References: <20200423013430.21399-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_183443_301656_33F257D5 
X-CRM114-Status: UNSURE (   9.82  )
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

Add a compatible so QCA9377 devices can be defined in device-tree.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/bluetooth/hci_qca.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index d0ac554584a4..072983dc07e3 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2058,6 +2058,7 @@ static SIMPLE_DEV_PM_OPS(qca_pm_ops, qca_suspend, qca_resume);
 static const struct of_device_id qca_bluetooth_of_match[] = {
 	{ .compatible = "qcom,qca6174-bt" },
 	{ .compatible = "qcom,qca6390-bt", .data = &qca_soc_data_qca6390},
+	{ .compatible = "qcom,qca9377-bt" },
 	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},
 	{ .compatible = "qcom,wcn3991-bt", .data = &qca_soc_data_wcn3991},
 	{ .compatible = "qcom,wcn3998-bt", .data = &qca_soc_data_wcn3998},
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
