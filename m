Return-Path: <SRS0=0xNA=W6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBE9C3A5A2
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 17:38:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95BDC21883
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 17:38:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PU6dw2hB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95BDC21883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omM9hLWdLEtfqJgHn+296TK3rdVxYCQ4t14+WQwIAAs=; b=PU6dw2hBZw2goi
	Dml/D4p5D6p0harQ7QY/ijdIoK4CotUgiGozvnlBoBdw7FIP1YG4usUFN8lrBjotrkVD5DQ7octZO
	FDnRKnRkcTDNZoP5Xu9m4BhPIQFwgVbVP8EFC125Pvw6Y7JloTyxxYNgOzvEOri5AcPtYgxUDLFpI
	r96i6UGMOtEha2dJfpgJZcW5AP75No2dQHDgWYOTLgA+eZU6EISWsu6AgDoGaW9DREtp3e+FU4Odg
	KzTK4naqRiqgPzR8SDyhkgrg4JvAyuK9xuY9DCxDE+Oas2+GObDMqO8btJGoxtgQZ4VStFeBBeLSz
	iqCvxrWjigcm21xEXv8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5ClJ-0003pP-0m; Tue, 03 Sep 2019 17:38:37 +0000
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5ClF-0003lj-M9; Tue, 03 Sep 2019 17:38:34 +0000
Received: by mail-wr1-f68.google.com with SMTP id b16so18382482wrq.9;
 Tue, 03 Sep 2019 10:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sBqHilkfOcB2dgVFp2zrGg4KecQIKZaO1baj+V5ZLeA=;
 b=RTIGjMqqSPreABp4suntba7EbxvzKNIQAB8dqzJgS7V2Itbl8UkYkUWgxiPZuiv1IC
 fcyJSYkXE8pybC1CV8hrmDw4dG7hZO96TFX0O5fbkMlt/zcQwqyRypYWq4qxolV6S2Fz
 6UM3Kh1C9cCqZPf2fF/U/BUqUwJkAWEuWnuZcbQ+lGkp7F3NBfzEOS0S9VvkIXHUA9l8
 8GolaQFOU5xMr8M0VSiUeWs3I8UNfOFOlE0c8OiFcFgh4kCQKjiO9GS1XzHbtkjcxrC+
 F85jHf0IUsORiQDT12mT69iVh0cKXVKxPKRnd3hDPC23/ItC7pMO/Gba46PfZbQ5Lu6g
 X9qA==
X-Gm-Message-State: APjAAAXrJjX2N2lrze1ac8MB8ZUGJpUbni4vm4Qp/SmFPHCjyLTr8re6
 Kfde01sQdQ9gWtHoT7yaWA==
X-Google-Smtp-Source: APXvYqwuvQAdZs7UJic1n+k8xOo79s2Fmbyq5hoWrskhkVJpqSnUJ1lpChQWcIUhDdxOsJpTm6mxMA==
X-Received: by 2002:adf:a54d:: with SMTP id j13mr43522126wrb.261.1567532312034; 
 Tue, 03 Sep 2019 10:38:32 -0700 (PDT)
Received: from localhost ([176.12.107.132])
 by smtp.gmail.com with ESMTPSA id y13sm17111114wrg.8.2019.09.03.10.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 10:38:31 -0700 (PDT)
Date: Tue, 3 Sep 2019 18:38:30 +0100
From: Rob Herring <robh@kernel.org>
To: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH 3/4] dt-bindings: arm: amlogic: add Amlogic AD401 bindings
Message-ID: <20190903173830.GA30743@bogus>
References: <1567493475-75451-1-git-send-email-jianxin.pan@amlogic.com>
 <1567493475-75451-4-git-send-email-jianxin.pan@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1567493475-75451-4-git-send-email-jianxin.pan@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_103833_756742_F5A1F5DE 
X-CRM114-Status: UNSURE (   8.36  )
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

On Tue, 3 Sep 2019 02:51:14 -0400, Jianxin Pan wrote:
> Add the compatible for the Amlogic A1 Based AD401 board.
> 
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
