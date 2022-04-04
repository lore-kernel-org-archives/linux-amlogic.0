Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72BCC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Apr 2022 08:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Th3sndh+mfAIVe6sDbXmSq/zxDEuqFRZJRMUnQ8PR1I=; b=Bf7+AItgfOokOx
	ZUuW5fNPpCIddFOUeTTuBkEN7Tro2BM89cA7gx7pvsps5YUTknu/rc1788RYwYVkf5pHX+RcNk+TR
	0vxBkkJYi6Q/arFA1XC21dBcuaOtYHn8PE+CQTeUpFDciZ9xP0UlRhSJdQRzjFOCazXDJcWg8bJdD
	NBykbD4eCBTv2uStBCtSmmn6URmYm9Es2ht7bh7JwAt1IiTU8BszZsiIlIJM/vUbflgQ38MR4xG0P
	RIEpyE1eQwzlMuHps/3ZbP7/lb1yIVA926ygbFJjNcQLW5ZuVOzrkKqjMN+Bu4zbgNc/dacaVK5er
	lfdr9UUrQ9W1AAEL3JRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbHpW-00Dmbw-HT; Mon, 04 Apr 2022 08:12:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbHpM-00DmTf-Ux
 for linux-amlogic@lists.infradead.org; Mon, 04 Apr 2022 08:12:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 n63-20020a1c2742000000b0038d0c31db6eso5098790wmn.1
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Apr 2022 01:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jlztPl2Mn5Z9b75a8aDKzDu8XcFOxiCHfCOqKuF/Txc=;
 b=WaqThE047oI6XlBTwAMpdom+WsP5k066IK7/CLPkUOSQ9DSj54oUqeP4dEyciYqu6A
 Ld71Kl93t4tS2ymQPTBpFA68E8RqJaIbscIAFuNTbhoHcA3f6RdHc4loEj5QHaAGzYfM
 YM7FtjhHoJUpn3ZCSpaJI422roKG8l7M221GcOckTYNlmTFkqqDHOqBZDBtBCIo7giOZ
 5Jur2Udwfel1nM1Xhm5isqjPCaXueaFSZkFaeqqtP5YBejcTYWh/fV8hQVZ2DQ+cCiol
 E/pHDax6+q7DAzl0k9GumrYme4gC5ImRZU0peR0QtEBDX78zIJD1ka23XW5HiUCQnSra
 wwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jlztPl2Mn5Z9b75a8aDKzDu8XcFOxiCHfCOqKuF/Txc=;
 b=jvBZbME7AK938vexozo1AIUVAiCR72TyFcIMehoIUqCz41HKPT0oPeAPQTvuy0xe84
 Hi/EszNeSvwGGMfJuiRB0zd1Ov+LVBfh7c5UDbGz7z0MEV1aRBH2KZUwdAyn+nYdKDoK
 r2P7/W6fAAbY9IrsUNMOaXYMnWhHG/Xd9lxnSPGzC4pPhQ02leS3fJsXfvkKupeviz1O
 b/nlgGGcbdu3z5pDLP3nDfnJPwYqWc3BocxX0JbLB8MlUeVlDQc8j2DMgOqG3PSpNUcH
 AKS5DuQFSLKkzg8jOETKfK0Ze2lFJ3NQQx/YX5UArQp25Ozg5RadZ8x8ejOXvttAOXrK
 27KA==
X-Gm-Message-State: AOAM530UAh+00foXn87RJ30xpmTSO60L+U1yXOXtig71zUBci4FTu6rF
 /SeQuPVygMa8azm+JdzeLtZQow==
X-Google-Smtp-Source: ABdhPJyl7Y99PyLWCJ09Fd3yDwSg/hDgVeGVWjBXSX9o5YLMjDvlRHKIofbJGxYdJQ6gzvUMTNIn7A==
X-Received: by 2002:a05:600c:2213:b0:38e:7138:de13 with SMTP id
 z19-20020a05600c221300b0038e7138de13mr2975996wml.26.1649059958397; 
 Mon, 04 Apr 2022 01:12:38 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:1add:1b28:2457:eb46])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a7bc38c000000b0038e708d163dsm3297510wmj.0.2022.04.04.01.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 01:12:37 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Qianggui Song <qianggui.song@amlogic.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson-s4: add pinctrl node
Date: Mon,  4 Apr 2022 10:12:33 +0200
Message-Id: <164905994876.1805420.17725203100639956158.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310030410.718-1-qianggui.song@amlogic.com>
References: <20220310030410.718-1-qianggui.song@amlogic.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_011245_031650_FB91EF97 
X-CRM114-Status: UNSURE (   7.95  )
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

Hi,

On Thu, 10 Mar 2022 11:04:10 +0800, Qianggui Song wrote:
> Add pinctrl node for mesonn-s4
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.19/dt64)

[1/1] arm64: dts: meson-s4: add pinctrl node
      https://git.kernel.org/amlogic/c/6383f5a212a6b569ff15bc98ba8b3041a35db6ee

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
