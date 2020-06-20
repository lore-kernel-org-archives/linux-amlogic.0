Return-Path: <SRS0=BR63=AB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D58CAC433E0
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 19:27:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A49B123D69
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 19:27:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uRzU8+zn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ntaLZQiF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A49B123D69
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bpyosypj6W1O3M7/nev3gTFT5SsXpWk65rdoHq51oHk=; b=uRzU8+znLqIvx1
	zGjm0nlIaS2QdW+ga5LCZtPx8z1xKl2J6oUVwjd6ybzglYF5GurVnm3FNUOdDw8dLaZTvCJkyC/JB
	pQiuDMwVIqShJuIGcFtBJ7krJvVbsdlKFLaMKgrKkk9PbCJpUbHxd3xSCSOcxGUamh7fsQjYhgNAT
	YRgCwy0f8xJ/ykFrPycU6wXgdW9J1HbU86gJEl81k6b7TKhzSFl3gRV5Bq5NyXAqCNKT1lPM6li77
	JgeoOs2sIgqOdZfhSxs5El3wbPN0Bo7CMweC7LIQqrLvjoSNku1O/7T6SAxxaA3NR71pRzdATS7tF
	oh03rH30uBVeaN1p0Yww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmj96-0002Lj-Mp; Sat, 20 Jun 2020 19:27:20 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmj8q-00029a-Q4; Sat, 20 Jun 2020 19:27:06 +0000
Received: by mail-ej1-x643.google.com with SMTP id y13so13939511eju.2;
 Sat, 20 Jun 2020 12:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mUJH12LGeW9ylYQEdpmnE0J88t7sUIOSezt8ZphdlhI=;
 b=ntaLZQiFRDVbnTDcEeJmaep8QFe8P5X4WgGS4Eo3LTzE/WmPZLunUnKGx46AH2zK5v
 ljBWj3sCov2YBpl0GnI7foLID/zGz/NiFdcS/W3KvxVJSmO/1TqTGbQpRM1lVsF0JpAi
 CnMM/jb2mhg3TXUsHxoW8imEGoD0xVO1fZh9xtK+HuJr5FC1PXq2EajvcF+ovM7A/ASg
 twTNA4hK18kdYBmfi2ObV98lVtx2An7RnTQQWRZu6HtCLAKnTQDTctWVJu6CpedJEsYK
 8taXz8a8LHiKYo39atZe9D1gs2G0c9IuW3FpftVSEmpiT9GfuMAbf+WPXNTbqeAKzQ9+
 l+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mUJH12LGeW9ylYQEdpmnE0J88t7sUIOSezt8ZphdlhI=;
 b=t2a8CkSlw1uXfBxjdYASnvY1rqAs5sO8CH5rM4nxsfYGdL6QlcBxENR5Bv6HK/G3+J
 sb0cpY3b3OrGcwloGz05mf5ke/L+bie/Ky3j6xS+TlNWLLBmyDa7hFxvmMyCdVNIDG7s
 8kPztWocadkMSrjNfrnhT4P8AJd9L9PyW/WNMuGPi8WXtg4UuDLun9dYBxkyW7ABM8Lq
 LXYFPRfb1ZoougjsqAAR1B2pUCJwrNm4RmPi705eVS7s5wSrlft1d4Oak8uCkW1SPyJq
 Y1xU3UHXtmdvQfmYZBA+0VGEoWVYhdKq2/t4GjK9ZhCzLNggzrEtbRcXb1xJ/xhT8lAP
 5+sA==
X-Gm-Message-State: AOAM5301MWlJDasqAavT5rpVcT5xIlpQhhWE2FaAi/CM7eteDAl43kG+
 hT9A0vHFeAdmCvLDjjIcgmQ=
X-Google-Smtp-Source: ABdhPJxsrLJ6aA6NVzk/zX8t11cs2ETNgzWKiUMxMnSjlqyiheQL1voAGp96yx9pCHlNR3b39ESu8Q==
X-Received: by 2002:a17:906:7a19:: with SMTP id
 d25mr9321045ejo.333.1592681221933; 
 Sat, 20 Jun 2020 12:27:01 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371df700428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371d:f700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id
 gv18sm8034044ejb.113.2020.06.20.12.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 12:27:01 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: davem@davemloft.net, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, robh+dt@kernel.org
Subject: [PATCH 0/2] prepare dwmac-meson8b for G12A specific initialization
Date: Sat, 20 Jun 2020 21:26:39 +0200
Message-Id: <20200620192641.175754-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200620_122704_842616_AF30D745 
X-CRM114-Status: UNSURE (   7.33  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Some users are reporting that RGMII (and sometimes also RMII) Ethernet
is not working for them on G12A/G12B/SM1 boards. Upon closer inspection
of the vendor code for these SoCs new register bits are found.

It's not clear yet how these registers work. Add a new compatible string
as the first preparation step to improve Ethernet support on these SoCs.


Martin Blumenstingl (2):
  dt-bindings: net: dwmac-meson: Add a compatible string for G12A
    onwards
  net: stmmac: dwmac-meson8b: add a compatible string for G12A SoCs

 .../devicetree/bindings/net/amlogic,meson-dwmac.yaml          | 3 +++
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c           | 4 ++++
 2 files changed, 7 insertions(+)

-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
