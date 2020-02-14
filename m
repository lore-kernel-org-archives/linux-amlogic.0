Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B102C3B18F
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 08:58:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D465320873
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 08:58:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oqmfr5JJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sorFWCWI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D465320873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nd85rEAegBnkIXytd55fwNnz9o0piA+tx++u3nSjfog=; b=Oqmfr5JJuNnyW7
	CoCpflmD7gZYJzXstQR9L0MtEMtNdcGsqn60mMNveWk8zMOVeckZdeTDxZJWWwsP74+RR7v80q8Ud
	moVn4urxX5PR0pD12rMQ6MyL32jmVuR7GDhP9y/54dA1oo2oUFJxQAmHwqo0q2f11JfRc5xVinSiK
	xga1mG98BLti/Rn9cnO8mun0SmaJRXc7Ua/mWhzaD4HPioibghjeKPHtaKHKykPRGHys/Irc1qQR8
	A+xUX15Bnf8ZYAZIc23mOOxTPe8sp6UoFj8EcvX17ZHEo6aipWt3z4JkULvFhE7y2mPWh5EaBXbJd
	yQMEkw6vM+woybBAUusQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2Wna-0004GZ-EV; Fri, 14 Feb 2020 08:58:10 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2WnY-0004G4-6Q
 for linux-amlogic@lists.infradead.org; Fri, 14 Feb 2020 08:58:09 +0000
Received: by mail-wr1-x441.google.com with SMTP id t3so9965812wru.7
 for <linux-amlogic@lists.infradead.org>; Fri, 14 Feb 2020 00:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L8Oay6M2aipK08IBflheRQHNuufw6eTuZLUwnVJHnls=;
 b=sorFWCWILNy5MZNFcQfwY1Z2yc4r00I7QJ61cWt8A+va2UyyPpE4Bpy4eV8cHii39y
 g7ypnfKjfPfe2Qsc0eWU2HlaOGFIBQrORnBxuird34/OUcGj1Cx923/rk2TQICdd09Ol
 CUf/iwQIA0RU0KY8OjkKAU6mTa8W+qzEobj+GhIpARfTiwDDush9cY10NFcE/hzFJ1mO
 IP2iu2oamGnBQtaeT9Qjlmld+F04KXbNReH/e+E/r+RQ86evkrjY7KED0cLzjTEX3Asd
 a7voMdvrBiKp/7I/iGmUhOtC5kD+13l6XUMrHeObLjKLEaUfELyvFr/0lNxP0tH8y2DJ
 tfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L8Oay6M2aipK08IBflheRQHNuufw6eTuZLUwnVJHnls=;
 b=ae5nKSheRIU0hbJUQdYLqnqVwXd1fH3BP4XW6HpIp5jx8nyglwpMic0wZk1e+EnjQf
 LbJ2W0ULQoRL9Vv45HXBArPOV7AI93SMdc/Xgk3ZlLwQpEa1knff/2qOW+ClhYJjTwRI
 VzIzTgqpBPRjOu1PlUP/FBIRS/HUHBZ5wWcuCcK3L5jDzXy2onOqt7PSJQsto2/pj8B5
 5o66GFjj7AsxKicSEI6RxNdRuY4vyz/N5++VunVPv3x3/aelctS/Ou5WJnWQJXqn68EF
 3SK94hUhSaBUXnuISpjIcRn+yqyi4xvu3ZmiCOi3QiDBBdzVKodmwc0nDYpLOThIvHaK
 9e0g==
X-Gm-Message-State: APjAAAWZZDivCLrIadUKiml/1qzIBMxxr991OjYOr0uuiFiPPnAkGGbG
 x7JMZqgPnM7ibK/XpufTzH0=
X-Google-Smtp-Source: APXvYqxKdjXN02Pnj9KYKKYeXWDFgZFeIGk7m5MUR6KEQFGwQxCVqVt2738iyFf//KCaatVTWWbXXg==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr2815815wrm.131.1581670686537; 
 Fri, 14 Feb 2020 00:58:06 -0800 (PST)
Received: from localhost ([37.237.208.38])
 by smtp.gmail.com with ESMTPSA id 2sm6112697wrq.31.2020.02.14.00.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 00:58:05 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
Subject: [PATCH v5 0/3] add videostrong kii pro keymap
Date: Fri, 14 Feb 2020 11:57:59 +0300
Message-Id: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_005808_261141_6E615AEE 
X-CRM114-Status: GOOD (  10.89  )
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
Cc: Mohammad Rasim <mohammad.rasim96@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Videostrong kii pro comes with a NEC remote control, this adds support
for this remote and also select it from the device dts

Changes since v1:
- fix styling issues

Changes since v2:
- use KEY_VENDOR for mouse key
- use KEY_PVR instead of KEY_RECORD
- use KEY_APPSELECT for the launcher
- use KEY_TV for the tv app key

Changes since v3:
- add a patch to use the keymap by the device's dts

Changes since v4:
- add a patch to update the rc bindings

Mohammad Rasim (3):
  media: rc: add keymap for Videostrong KII Pro
  dt-bindings: media: add new kii pro key map
  arm64: dts: amlogic: add rc-videostrong-kii-pro keymap

 .../devicetree/bindings/media/rc.yaml         |  1 +
 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   |  4 +
 drivers/media/rc/keymaps/Makefile             |  1 +
 .../media/rc/keymaps/rc-videostrong-kii-pro.c | 83 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 5 files changed, 90 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-videostrong-kii-pro.c

--
2.25.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
