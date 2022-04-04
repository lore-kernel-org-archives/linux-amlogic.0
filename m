Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26135C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Apr 2022 07:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bAVVzsV+zgCEb8rNc6IT7iB0wVP8qNOnxA3wK8pwJW8=; b=Q3KFHrdyqcVeCX
	XF/qoTLS2Cmhx94+ed5LPJk0GpUOefTb16ICNDHQdKG/dEeubGKgp8aSA6fHtwZD+dVYKylrmRn9R
	U7LPAauc+SyE/0zHIkVDLqEQC+IMbmArimy0gK00IlHnAFHGgstCdG/DHVW8xYQPfDW1auICwVy0/
	2kTMElH+IF385RzSnZpB72G0oOaMQ84IkZ/b/DCkmLlAgPtsjF8ey9CtIGCugBFXMyLyH65KS9Jtn
	V1ELMxroAose4hQOZfPDCuO6yQn/fdh3jIRNWfB7iIeCBnbnofc9vDTFURb/eM9kTry+s6YCA4Sy2
	9zF3MT0wCfo8o8iMabRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbHWv-00DhYu-BD; Mon, 04 Apr 2022 07:53:41 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbHWs-00DhXn-OJ
 for linux-amlogic@lists.infradead.org; Mon, 04 Apr 2022 07:53:40 +0000
Received: by mail-wr1-x435.google.com with SMTP id k23so556422wrd.8
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Apr 2022 00:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Va1uiLP023t5MihYO/Flcr7OZNL1vNKKp5c2ZjT5AYw=;
 b=VNyJRcdNveWkpMXVdciF4KakpZiiW50ocgP5YSME8fh3xUgRcRBcJU/rD+Wnfdxx7A
 Y7ikB5gYpemDjSLgjNyMpJ2cUbHrIADnCRs7A4HChUxwDg4Pi7+7Jfo6PVhYLmpQYnVC
 BOT9OCrzMtsF8hBQlkAjpG7/k5lQj0+JRYDfjIqkiwquBvj18clVBVISCvycxJchL9o5
 aqk4YZPSZXPIfDGcudm87F4kqJClWQ2dfU9noSroszqA1FARCGGehMpA+Hi8RVolfeX+
 OxU/jOSla+tZI4ohJ6j/bPmNuBGO3c8WsNOU2T1J0Fhg+v6cjONZW7rMVSpJYyXaIL1u
 k3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Va1uiLP023t5MihYO/Flcr7OZNL1vNKKp5c2ZjT5AYw=;
 b=WzMA27HYNcF6t4AeMDgS8YMNCEmnWAJplLAhqqwJnPD8nldO+4FKJ22BdgaP/ilZpk
 DZaoKVugabrDYqnI3sqqPOYV+zArh8pwc7GrnjOdQvxl24uuvQIER8A/6wOi4hpudolO
 PW/ea0jXQF+h/F0i2xNEXpT84doEbqlrSg3KoQtkPpoyXgNkqHgOSkV+C8Iuizp9JB0W
 zULAuORVpAJ9oj2C4rDNzr0Blxct67WbGAZbsKXwWQOxxYk9eqewEHOBbLW3mGMoGFC7
 /tZFDi04tNFDaqV0Q2cMCTAWsuAcUiRNqVaHZdVV67cS/xCHk3bJ0K4fOIewTfcDytw/
 PJvQ==
X-Gm-Message-State: AOAM531l2GN1wyHuWSOEzyyRXh00xPc+1iehMBevlZJiV8/L0xtxueia
 vuKBz+6FxMPp/0bLdD1Sjf87pA==
X-Google-Smtp-Source: ABdhPJzs9+un4qKZIQaAzrww2f9CT3skrXSwzLMlgxxyZ9AMGMUBwhl0FAI8l0Ot7SRoZMVhtPZDyw==
X-Received: by 2002:adf:cd11:0:b0:206:1108:ebc1 with SMTP id
 w17-20020adfcd11000000b002061108ebc1mr2878589wrm.33.1649058817433; 
 Mon, 04 Apr 2022 00:53:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:1add:1b28:2457:eb46])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a056000188100b002041a652dfdsm8510186wri.25.2022.04.04.00.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 00:53:36 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: meson: remove CPU opps below 1GHz for
 G12B/SM1
Date: Mon,  4 Apr 2022 09:53:35 +0200
Message-Id: <164905879796.1795914.1262665444857869291.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210100638.19130-1-christianshewitt@gmail.com>
References: <20220210100638.19130-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_005338_830761_5F32751A 
X-CRM114-Status: GOOD (  10.14  )
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

Hi,

On Thu, 10 Feb 2022 10:06:36 +0000, Christian Hewitt wrote:
> Amlogic G12B and SM1 devices experience CPU stalls and random board
> wedges when the system idles and CPU cores clock down to lower opp
> points. Recent vendor kernels include a change to remove 100-250MHz
> (with no explanation) [0] but other downstream sources also remove
> the 500/667MHz points (also with no explanation). Unless 100-667Mhz
> opps are removed or the CPU governor forced to performance, stalls
> are observed, so let's remove them an improve stability/uptime.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.18/fixes)

[1/2] arm64: dts: meson: remove CPU opps below 1GHz for G12B boards
      https://git.kernel.org/amlogic/c/6c4d636bc00dc17c63ffb2a73a0da850240e26e3
[2/2] arm64: dts: meson: remove CPU opps below 1GHz for SM1 boards
      https://git.kernel.org/amlogic/c/fd86d85401c2049f652293877c0f7e6e5afc3bbc

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
