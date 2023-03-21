Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A927BC74A5B
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FHh+dogelw5eoX0HufHtIwjJ6fOkXUeSk8TfsEyly+s=; b=DwXmo82kLIoRYB
	yYGIlIV2qXvm73xuA/Eb8c+ELjVq+OdCh26qUYMpkkL1zKdmUgdiF+V5W0ENYFhIZxTsuB6Y3m2E4
	fmdIOr2WDyNO3VgjOGEPsVhYtqnlkMW+lQBpjAIqSDyV0wR2DeeOj8reKIf5W5c3MtEe13xYOOOXg
	CojF3wlvC6z+L3fzIviOK5liyLgxzbms233S0SpWWZx/gNrJDO3ASbVSvCGU4iRCDtvewRv6xKbtM
	2SNcyQL5cnMjECyP+MFfRnJKJsaoOv/3aYzl9m3lFq/pHEc6ZO5os7juoV2XnDGtUsc1Z41DfU6BO
	j6iWOt6fGdZUx5wasxBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peZQb-00C4qC-1S;
	Tue, 21 Mar 2023 10:41:17 +0000
Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peZQX-00C4oM-0P
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Mar 2023 10:41:15 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id D099020041A;
	Tue, 21 Mar 2023 11:40:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1679395264;
	bh=KCCATZkTr+7Q3TiUEqunw+3zj4NwVvKmBZameTcJZZ0=;
	h=Date:To:Cc:From:Subject:From;
	b=uToAtzfIpIaP4K567OQRcAp3j5BLtqLpONLanYT+KGrwDJHQHB/ounDJorAs627uw
	 YalRsK6VxilPt7sYfuiwQXedPkl7qk+qRfnyxArlUViS10V/Ang1GBAVITq8FIdikC
	 z3f1v3DtmKKESeRNv3MIG+kUf1pNHLUrQ+jG3MwsDpxQZ+Lem03Rm9ur9eCwSey4hu
	 pQXH134cmjPTL/Ptm+pXqlFc3OKt19N82KriW1RmzpH4IceKu3LIMRes0Pm8EyEwjG
	 bR9/DgLsGUnUym+pHRHuffznAkullCl5ic1A2VosUA9pqjy1HLVWMuIr4TBiKXfFkN
	 S9CZlRY2+PSRQ==
Message-ID: <b9bd16cb-f1fa-34b7-d599-8637cbe5032b@free.fr>
Date: Tue, 21 Mar 2023 11:40:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: linux-wireless@vger.kernel.org, MMC <linux-mmc@vger.kernel.org>,
 AML <linux-amlogic@lists.infradead.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>,
 Alexander Prutskov <alep@cypress.com>, Joseph chuang <jiac@cypress.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@gmail.com>,
 Angus Ainslie <angus@akkea.ca>, Heiner Kallweit <hkallweit1@gmail.com>,
 Pierre-Hugues Husson <phh@phh.me>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [Performance regression] BCM4359/9 on S905X2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_034113_594301_7B028F1F 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

Hello everyone,

I've been benchmarking an Amlogic S905X2 board.
It provides a BCM4359/9 WiFi chip connected through SDIO.

There's a large performance gap between vendor kernel and mainline.
(Downloading a 1GB file to /dev/null from a device inches away)

# curl -o /dev/null http://192.168.1.254:8095/fixed/1G
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 1024M  100 1024M    0     0  27.5M      0  0:00:37  0:00:37 --:--:-- 28.6M
vs
100 1024M  100 1024M    0     0  11.0M      0  0:01:32  0:01:32 --:--:-- 11.0M

Line 1 = vendor kernel (4.9.180 amlogic android)
Line 2 = mainline kernel (6.2.0-rc8)

Why is the vendor kernel 2.5 times faster?

(I'm using the same firmware files, but it seems the vendor kernel reads
an additional configuration file that the mainline vendor seems to ignore.)

Regards

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
