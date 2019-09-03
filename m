Return-Path: <SRS0=0xNA=W6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85C5C3A5A2
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 17:38:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C46D21883
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 17:38:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c0qQZhp3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C46D21883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZpsGgMcv6gSuP3zyqtLtoL/wOjQHyJD5rXlnTy6Gjs=; b=c0qQZhp34gBn+6
	cJi4p+KI2YiVt5wNcTAIO/95ufHlnSdJS4pmNxAkZhLFlM6A0oV9Pvfs4ZA1MLqev1/oL3ZRBDLhs
	5DE36EkdQFbCrSwbfdFESuWvgbdVgcY6weJjmFQOXk8Iy3oq/zHwr5xqPKTPzBLrLIs/QyxhI9FTG
	kR4fNOP0HHPNwxFFOrnaB/0REUTeBIcwnOwUW33UEjk+3JvC+fTOnfx3EjRpljvUFwVNjcE4g+OLm
	4MRcIQVxgrgGkVp4AhlWvSAX/0Q0kTTcXhDQXYUvDOGZEEN8PiZZ4qKB8Y2Lhx3SQ5G43K4iTcjCA
	H1awNaoRT/6cXAFH9n8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5Cl0-0003Vh-TL; Tue, 03 Sep 2019 17:38:18 +0000
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5Cky-0003VG-6o; Tue, 03 Sep 2019 17:38:17 +0000
Received: by mail-wr1-f65.google.com with SMTP id j16so18400454wrr.8;
 Tue, 03 Sep 2019 10:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BKVEXZU6W+dO4/h+hhmxBNGUoZMyM7LM4xnC1FiFh60=;
 b=NESLi/vfI4MA7oCeWc/u8aKlXCyPjZP9LNEVTQsXn+pD2NLzPOKD4eQOkjS8uOy0TW
 RpLsbYPLPiZr7OHSg+sm44BsGNjhJFOhgXy1FnIns4BCf1pZYQSW0XUFsAkPwsjmWbw3
 ovJF+claj7y9uGd/zRX8nQaezXFmb1JqThO1JeB4FQ6r8IgvG6eyFTQjt6zF4RN9hgPD
 1bvIWiqbrd/akKmRtTi+GVGzfVaV7FhxZhRdOWymqGjmLHwvxsVl5ReyfGYoSdlMaSQB
 j4V7j6s4FHGr+UhvZGesInOQzYyGPUUeAHNCf00fv3F78QnyXOxSrklM9he2ixJPo2Xl
 3jQg==
X-Gm-Message-State: APjAAAVhYJby4nx2gzcbCiPUvJEXEpEXnojhu0eqRcIla8/346p+hpma
 vrr3+R0eEYYYoZcfInflNg==
X-Google-Smtp-Source: APXvYqzRQYJLzntZeTliorX2sDTxhd2HeDwz/MkYnaY3eYsSmuW3XzY+VKFpZ82MlkNM+XLjzG8B7g==
X-Received: by 2002:a5d:4402:: with SMTP id z2mr11533990wrq.183.1567532294879; 
 Tue, 03 Sep 2019 10:38:14 -0700 (PDT)
Received: from localhost ([176.12.107.132])
 by smtp.gmail.com with ESMTPSA id t22sm326468wmi.11.2019.09.03.10.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 10:38:14 -0700 (PDT)
Date: Tue, 3 Sep 2019 18:38:12 +0100
From: Rob Herring <robh@kernel.org>
To: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH 2/4] dt-bindings: arm: amlogic: add A1 bindings
Message-ID: <20190903173812.GA30084@bogus>
References: <1567493475-75451-1-git-send-email-jianxin.pan@amlogic.com>
 <1567493475-75451-3-git-send-email-jianxin.pan@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1567493475-75451-3-git-send-email-jianxin.pan@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_103816_250486_99D88E11 
X-CRM114-Status: UNSURE (   9.00  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Tao Zeng <tao.zeng@amlogic.com>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 3 Sep 2019 02:51:13 -0400, Jianxin Pan wrote:
> Add bindings for the new Amlogic A1 SoC family.
> 
> A1 is an application processor designed for smart audio and IoT applications,
> with dual core Cortex-A35.
> 
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
