Return-Path: <SRS0=RQ4l=OS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D33C07E85
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Dec 2018 19:02:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F0BB2082F
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Dec 2018 19:02:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nffca1ty";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="jgEw9UJ5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F0BB2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZNY/KrCpBodlRzNVfBOHZQJGJ9SdF6cV5F3zFkge4nk=; b=Nffca1tyS9iTJu
	/8hKwQ08kx+hbsNkx563sVRODMldTAVPp2VQJU62MbZqApDoVBfSg7a7UJ+FOlvP2iupUB0Ed5o9q
	XT8esP8vyMCq/w7OljzrEu7iQfY7lNdkJTcMd4DzAkaMr/K/5mIi+n7ZWUSp8AeCSYJgpDMK1Lgig
	tI+KNcQeaWKam/TAYBKrmPG/d8NWJ052YowWQPQfVmPBh1Za+s3WUXyvDTYXEROCKO4gK0Z255Ncx
	HOMZTudGefPlO+JTGvEfApkfQB1wjOYFS2WhcqzOu4RKU74zINbosbgSmh7zFT3zIQ5s/vthlsInl
	0udpJGGFgJ+EGipe3NSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gW4L5-0006Uk-5p; Sun, 09 Dec 2018 19:02:03 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gW4L1-0006SL-MP
 for linux-amlogic@lists.infradead.org; Sun, 09 Dec 2018 19:02:01 +0000
Received: by mail-wm1-x343.google.com with SMTP id y1so8786991wmi.3
 for <linux-amlogic@lists.infradead.org>; Sun, 09 Dec 2018 11:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HXSMs0NdnNkqvE+essbtRJERcGnZDdB0NIQwHQkfznU=;
 b=jgEw9UJ5+BIrlKkd4a0Lsqon6XQXbZ/a8hmURa6s8t2Of9WWHkTXNZ3D9SlsDk8owv
 p35MalkHa2wfTimgcLVrv2EDHWJbNjFLCB/QOGZR+Gi+p2uA1WnvWTJ4dR0nLc0JzuI2
 9YeSA5rkwnFyqZJ9m7T+KkC2SykucQ6YjX3g7xkYDFkNkLvPkhSezFn1Xi2FGnVBoLm2
 HiM0QG2hz70PcXbepFY6WvQA2U/3xhP9sAW2lbZRJy11u9bFmANP6m/c/4LR+VN3EFTW
 vAydQRZqfarVAYQLHH6mb6SjzklejSG3kKoCRQKWl+rag2RGDNpD9l2nx3EmmBlK/f6W
 mqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HXSMs0NdnNkqvE+essbtRJERcGnZDdB0NIQwHQkfznU=;
 b=UB1YWG4GBTP6WVmaTBmm2OlrZ1B7E5/oPzqiDoiA3qt/RGT5/jwhOZ4EXU7NS10qAE
 4kByIs0K9tGm3W4/BUfV7sRxx+/RoeMOOJzqEZnNNh/w3l33ENZPvXDtDcJpv2bCidh7
 b67siHZDJ0uofa8q8l5l+sOu9y5jXMTThu+GcDGv9weQp/Ebpu4NZUdUaQQLO39U89NC
 OjrfcyPDMB9T3s3xrNX3nQeLJT7ihogGG1m4pTDe/Qoy1C0WRNfC3IEXj4dhCH6hoe9Z
 CEv11JNtwya01jn3pzs+xxL9zjGDTev/ln+byj4IoqZHiqJMamfiOnI1qi6wYVWZCwya
 7iTg==
X-Gm-Message-State: AA+aEWbET1Caglpky2HNDGf6b6caUVe1iyewDIbE9iZgXidzi2mXE7He
 jWtJYJvl8si7ptyOgD1D3ro=
X-Google-Smtp-Source: AFSGD/Usb7ciHKS1m2JjKfFgZbtzRFNRlos0jD2DrM3jwhZQOcFrGJW5a5qHnQqTXg2cxDnVHYRb4A==
X-Received: by 2002:a7b:c24c:: with SMTP id b12mr7474590wmj.29.1544382105141; 
 Sun, 09 Dec 2018 11:01:45 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD73FBA00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d73f:ba00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id
 l197sm30560215wma.44.2018.12.09.11.01.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Dec 2018 11:01:44 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-usb@vger.kernel.org, hminas@synopsys.com, gregkh@linuxfoundation.org
Subject: [PATCH 0/1] usb: dwc2: fix hot plugging on Amlogic devices
Date: Sun,  9 Dec 2018 20:01:28 +0100
Message-Id: <20181209190129.11870-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181209_110159_737446_84CD75B7 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, Arthur.Petrosyan@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is a follow-up to an issue I had a while ago but never had the
time to debug it: [0]
Short summary:
- on Meson8b USB devices are only detected if they are plugged in
  before booting Linux
- if they are plugged in after booting Linux they are not detected
  (except when running "lsusb -v" as a workaround)

Christian Hewitt made me aware of a similar issue that was fixed for
Rockchip devices. This single patch applies the same fix to the
Amlogic devices as well.


[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-May/007310.html


Martin Blumenstingl (1):
  usb: dwc2: disable power_down on Amlogic devices

 drivers/usb/dwc2/params.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
