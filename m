Return-Path: <SRS0=pdBZ=4R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC43C3F2C6
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 14:10:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AAFB24699
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 14:10:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jMRkEpp8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NomLyUZQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AAFB24699
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=OXS5PAXXm36uz6Tg2D+V2uc/rvR+9a5U4gP/fyVNKJU=; b=jMR
	kEpp8oPaCkiNRxWS2/K8ADXIRmBZnJDHtWWm+ZssCuLM9C2CBOewoVyCYCdnSWN353VtgE6A01G+Z
	b2WkTf4yCoeunJWRqhO9ygIUuVOI/oPJTLWwJeUmLgoH3o8Lyy+qjbiVlHTwHWNKh+GONiHWuCIJf
	ek7fS80ScDMwwnw7rJ6UqlhnKGoiS11acxl0hn+mhw9WUsp1KnT0tHmnMIHkvDUlww0Dvb1WYN9sD
	wWY9k72nFVJoIZUCKyMKXAKufHG70+v0FijHMPIKrEZpnn83fODwuW0ghhqUS0rpG2YzZbik0nFzV
	RnPPfKmKK6/RmtTOPq3nNteHZ2UBzlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j82oz-0001MU-Rj; Sat, 29 Feb 2020 14:10:25 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j82of-0008Op-RJ; Sat, 29 Feb 2020 14:10:07 +0000
Received: by mail-lj1-x243.google.com with SMTP id q8so6542384ljj.11;
 Sat, 29 Feb 2020 06:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Q1D9zlcvNyYo46fhZp8SkasZqL/qaSdiAry5tMG2fAw=;
 b=NomLyUZQLLmi+T6Pk4g7aRbCnrybttmZOL2ID0dn6OeLEPUjqdidyiSlY5KQkEczm6
 9XGZ6VS1iMlkwXSdfo+WLR4SIiL4XpvBffncXi9P5B3I3qc5vnmRpmBotLDGsQ/TuUsg
 VDfalj69WXCPI1QuoqXAzBtIWNg/5RJWGdJvmh8EMuTqVpg6w0s2U7EtO3p6NM0QGi+A
 G7a3nyPKKqYuhgoiymMf0rdb4aVU5PlXWSdt2StPCrJ3zRVpKqQI0xd3gVUkMBtv8bOY
 M2KnIkgJVHPNho/FsPLlQuxFlNZKgj2xz4NC+9JFoGqbY/+auFvb/aWqZAQ9KDFKGhQ/
 fgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Q1D9zlcvNyYo46fhZp8SkasZqL/qaSdiAry5tMG2fAw=;
 b=guOcsB16HfC3BGSw6vlGHIUGpQetuDEI/HcNnGOdo6zO0u0z3XLDvoFPA7i1n+6qCy
 ox1b0CNRbLzBy5W/5KoNfBPGwxXxVnUiwzUwb0sghJ2vyiXlt/FaMFkfik73OGa7osyU
 14tP5Oggu7ZknWozQLpphCbyWiAp+WN5JGtfD6VtLLwoK81LXuzqDWXhPUQpGH2hTrpO
 7foIRMs/T9TZgtcysJbOxI6IPHXSQAvCtaUzxp+LZX907SmOllQLvVow3A61aeM4KhY0
 +S+D7lCM1jMc29gKYaif3a8SMMJQziUpPxsBBDWPqAJrIiLr0yQIHC3oxEnxQ3zDoMsa
 /Zhg==
X-Gm-Message-State: ANhLgQ2cnr53wx/dp1NkQvWZwYKuE5nU8C8HdAr3/OQ1JQHXXXPX3dHB
 bteJOetqOEjvtVMJP+wV8Cs=
X-Google-Smtp-Source: ADFU+vt8sOTpYv6VA6Nc47IHgZZX7w5n6LB0r6W1CMkeuA37qXQZc8NAkGzxKVZ2YFkIgTxvpt9x2g==
X-Received: by 2002:a05:651c:545:: with SMTP id
 q5mr6126951ljp.139.1582985404026; 
 Sat, 29 Feb 2020 06:10:04 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id j11sm7104124lfb.58.2020.02.29.06.10.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 29 Feb 2020 06:10:03 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: meson: add dts/bindings for Beelink GT-King
Date: Sat, 29 Feb 2020 18:09:11 +0400
Message-Id: <1582985353-83371-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_061005_935165_7B4D9890 
X-CRM114-Status: GOOD (  10.52  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series adds new bindings and a device-tree file for the Beelink
GT-King set-top box.

Christian Hewitt (2):
  dt-bindings: arm: amlogic: add support for the Beelink GT-King
  arm64: dts: meson-g12b-gtking: add initial device-tree

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  | 557 +++++++++++++++++++++
 3 files changed, 559 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts

-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
