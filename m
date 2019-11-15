Return-Path: <SRS0=o1hk=ZH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB00C432C3
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Nov 2019 16:50:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D26A20723
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Nov 2019 16:50:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CV6OOpFU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ev7IewpN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D26A20723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cuvHv7cEAR8KgoNPAnaVbw/1Dujt58QMc+VrT42z9oU=; b=CV6OOpFUhluTM6
	OwuBnbqKZwBdq1ZWdRcTY7bz8mUAcQoL75ws4PppJSkn0Bbg40VM+eKMhe2QlYURwUl9wauCFkVEK
	aN0lfkuiSpXg3WaJ0z5ahLPUogp4nuQjTOm7t7MW+1MH3U7/nI9frGuU3ZfK7ERehUgI2f4oJ/PGO
	qBttqjZWW5w3NNMAXoF8hnkfx/67P+4RIV0r4Jkwxkxfht3c01na4nf3CnCy3m5t74Jd+rNJXHM0v
	Bp2tRRokepukTQXMVXFXszlaLUEj3t536etuT8k4MxDryNEY+FEB/Joz0AyXE3DqnfKKjEGhJ7awY
	3O3NQgCeXZzX0PoSVVCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVens-0001da-GX; Fri, 15 Nov 2019 16:50:36 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVenq-0001aZ-DU
 for linux-amlogic@lists.infradead.org; Fri, 15 Nov 2019 16:50:35 +0000
Received: by mail-wm1-x342.google.com with SMTP id b11so10319326wmb.5
 for <linux-amlogic@lists.infradead.org>; Fri, 15 Nov 2019 08:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X0b/r+E+n7iEFY/Gia2VYL1tiK/YA1R2O85IGZXXJow=;
 b=Ev7IewpNaazT71gvYlQT8CYvIF8FTIEk47iS9Lp1PeJZis1SHqytHMfvHQ9sfdJtqe
 Ak3AwFbE9Tcxs6Assu6pynxs7dSXF4c7VMuKH2iF4DO+ukM33TjJqxRVITJQrfOtOw4k
 N2X2PZSa3z8auVfNz88QPrjSpEIZd00OADlTrxhkm3nQt7TqcFxChfullPHCpwQLOB/7
 fWe1lTHeRBBf44gsD+2cbWMJ4+tEwIBa4VL6418z3hdvhTwhuCFBl+pDiFe+JDE/hXyu
 oaAJMLfrZC+fVZ0kiebLQa2d5hmNiMSFo13PGvO0IeJz1ajJH56LDiuk3dcdhTVK0hW+
 WgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X0b/r+E+n7iEFY/Gia2VYL1tiK/YA1R2O85IGZXXJow=;
 b=HKameMPsgUQb66xEq01GkgDcYXeYFpk/V5cmq1+Hptv3AY1zeYaWaWHkakjIpDC1BW
 s8l1fz8u9SMggg+kxxmsNIrpl02nNmzNOaUkOOh9YrxmToCqMgxiRkC4WpYtuIYAGokj
 UKKrxjK3JLLueGZlp+97zoSXqW/2H+XNVyWkW9oma8hWBaMMozt6jXEfOvVabCt7fA5M
 eP0C76EHlV7cFfiaeOVOKjgUwKbMcCIiPVqOC0gNxjbsI6SEuGQ2iQ0JxkWWGKKAedVK
 7hYTq9XNy6PO7Jtz0cor78GC1TWz/CrOXZrWJR3OsVQBasHPsLQlrGPuT9Xnjdceqwys
 VQsw==
X-Gm-Message-State: APjAAAX+uuXetJfW71ubb9Pcx78aFkkQ3JC3pPXePxpnIzK1mNHU/x+9
 9Ydl2lCNAj3z6SZWVwCtSZs=
X-Google-Smtp-Source: APXvYqy2O6BiiUnvY3Jx01bZ49DvGmMsxVos5MvL16fk+o8q396/+3jd3p0aK+Z8eRopvNbkf/X2/A==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr15575498wml.100.1573836632232; 
 Fri, 15 Nov 2019 08:50:32 -0800 (PST)
Received: from localhost ([37.238.189.15])
 by smtp.gmail.com with ESMTPSA id 62sm14016267wre.38.2019.11.15.08.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:50:31 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC PATCH 0/2] add support for videostrong KII Pro 
Date: Fri, 15 Nov 2019 19:50:24 +0300
Message-Id: <20191115165026.19376-1-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191115_085034_454935_2106DA81 
X-CRM114-Status: UNSURE (   6.67  )
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
Cc: Mohammad Rasim <mohammad.rasim96@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


Mohammad Rasim (2):
  Add entry for BCM4335A0 UART bluetooth
  Add support for Videostrong KII Pro tv box

 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../boot/dts/amlogic/meson-gxbb-KII-Pro.dts   | 25 +++++++++++++++++++
 drivers/bluetooth/btbcm.c                     |  1 +
 drivers/bluetooth/hci_bcm.c                   |  1 +
 4 files changed, 28 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-KII-Pro.dts

-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
