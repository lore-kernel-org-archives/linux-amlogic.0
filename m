Return-Path: <SRS0=4hYR=U2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A595CC48BD7
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jun 2019 12:14:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CF592085A
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jun 2019 12:14:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iWCIZHLn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XdfbE24d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CF592085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Beuq0R96VLswOG4aHCu+8f8DnwM5EXSLsBDWJB65r3Q=; b=iWCIZHLnoCcdFx
	IEBQNaMc6gmH62s2xQpL+9LrOWjHQKceNp2/PCmjN9kWuMNrR+wuD95vKdUQB2FujWQCOcfNbWoo3
	pecpxtWgZFOHjjoU505bNvBFG2WavbOYrfLc861EGVeb+Ip9ftKHAse8ygwLrmuCoMgrdjmd5dbh8
	bc1CCG5WIwh2mf/7dPqk8HGTkg6yYYBmZfe27ttWFwxr4RkUES6Xw7ba1BALmpZwGq9B1TuXL4RnS
	gNJlWBSdWVoq1QtFEe0TCfZHb489uQ8cwGmzXaf9m6fm4OrcsVSCCzrUZNDfwxb9Kb9hw2MQzbLh7
	/o5Voes2iiZDnm02l25w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgTHv-0004Ad-F2; Thu, 27 Jun 2019 12:14:03 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgTHs-00049o-R9
 for linux-amlogic@lists.infradead.org; Thu, 27 Jun 2019 12:14:02 +0000
Received: by mail-wm1-x343.google.com with SMTP id z23so5445530wma.4
 for <linux-amlogic@lists.infradead.org>; Thu, 27 Jun 2019 05:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LdXcbqi//1yQdo7sH21GuoXxU61NLp73gRkdlfRljFs=;
 b=XdfbE24dBpd/sTmZ7q4zvtKudeNA2u1ZlCAXEV6LSSX9MhXFeHsJA89RAGLWnAXKz5
 SVrwt61pY7t/JEyrDiZRvdMmw8qKctFALBIdVUuWRHU/WnvcCMDN0IK8U+OnimL7puwF
 Slbnn8jecmWciwC7EuS8Tpk8VdmPuwZClsYozfuX6VZCVQoOeDpzVlchZJU26FXwdfy5
 pORUGm/YZEaHE/qjgWXlN/Ue67kPhK9qdJhmrEEL3hxk4wJJEcoOXRqO7ZG4kfkJ6OeQ
 UAG56yvB+/TjPpdUMEllkNehJ0aDgHDSIXuvklQkgtlY3BaehtSzHPujwV7ITEOl4np3
 uOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LdXcbqi//1yQdo7sH21GuoXxU61NLp73gRkdlfRljFs=;
 b=J6f/wSyROOfs2Dtb+O0KUZIOxXmECJ1G2QAGtBPPMW8lwNJy0KEnQbE+A/wDZ3zAr1
 wobpVmeqb8nxjIZ4eKQuvbrbRlX/l2xORw37tslMw1nqQQOn59W9ahF2ccwy+7Fdm9ii
 TYDBUXXMd7Pzvvg2VGfsrOr1+lJdK00AL9yjwggBGVigyEnM9WZxpfz6pOwB58OzhAl5
 XJSJjHk+EuFlBiL9G7dR45WCv90ZTRlbksxmYygTE8SiNFgen8Ld5jyc0lAUt36oLKeG
 I68+mBcgl/EdNxM/VMQ69AJvpXNNUMLOh0H5SdttJ4Y/8R0rz1FfpXWxnc8bKe20z17R
 Jw0w==
X-Gm-Message-State: APjAAAUw3NWY88DbdGuRblTP5bhs3FmXIgytEpKouT5QrWyYtN7LqM72
 YGf4wlI00Uqo6OmG48OXmmSD+Q==
X-Google-Smtp-Source: APXvYqxfToTeP7Z6wbZ2zjURbfpnhMu6weuA67216EZ1Md0Y5D3hlgGZi/3X8aMdt1KW9lO/15lYrg==
X-Received: by 2002:a1c:9ac9:: with SMTP id c192mr3273937wme.0.1561637639202; 
 Thu, 27 Jun 2019 05:13:59 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id i11sm6160594wmi.33.2019.06.27.05.13.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 05:13:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 0/2] ASoC: soc-core: update dai_link init
Date: Thu, 27 Jun 2019 14:13:48 +0200
Message-Id: <20190627121350.21027-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_051400_929752_11E4A830 
X-CRM114-Status: UNSURE (   6.53  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

My initial goal with this patchset was to allow a dai_link to have no
no platform component, instead of having dummy by default.

However, when rebasing, I discovered that Kuninori Morimoto had recently
done that in a different way :)

I am still submitting my change since it should allow multiple platform
components on a dai_link, which is one of the FIXME note in soc-core.

I have also added a check on the codecs component availability to align
on what was done for platforms and cpus

Change since v1 [0]:
* Fix registartion typo
* Rename dlc variable to codec/platform

[0]: https://lkml.kernel.org/r/20190626133617.25959-1-jbrunet@baylibre.com

Jerome Brunet (2):
  ASoC: soc-core: defer card registration if codec component is missing
  ASoC: soc-core: support dai_link with platforms_num != 1

 include/sound/soc.h  |  6 ++++
 sound/soc/soc-core.c | 67 +++++++++++++++++++++-----------------------
 2 files changed, 38 insertions(+), 35 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
