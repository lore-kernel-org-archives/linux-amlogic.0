Return-Path: <SRS0=GB2T=5Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B35C43331
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Mar 2020 22:07:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 798DA20838
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Mar 2020 22:07:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GbmUN6C1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 798DA20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rw5ZINCT0JQnj+toWqDBPGw22Dz0nArdI7PmCN4zxpQ=; b=GbmUN6C1pI1B7D
	BJgz9JOFFxBJ28LN76HJ/r9DLGYqNEfbvucQj5GTerkdH+osD7N3Dc59pUCZIcLN2Ntc+B1vu/dg5
	QmWuGamSwrPVDQ4ZsbepePKyEQUFrSNoUu8CaLT/f6RXHG0WEdK0/xEEs5rMxW1rakY1ZdH6wvsUf
	ezd6wU8WbgcdF2HWlmKj3bFKFMZj/4I5ghn+0Y5UPPZLbkKVYNOZXVIn+03o6ydxdVAEEfcvTz7l9
	WEdPadtih42DS6LsQXL+bvHDt0GVSOeF+WyOIZTOIsfG0bArzJXT+/SUtJNTNiZoELefv2lmyx4Cg
	Uds/HlHCA75ICfOfNFtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJP2Z-0008VH-6x; Tue, 31 Mar 2020 22:07:23 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJP2W-0008Ul-Pf; Tue, 31 Mar 2020 22:07:21 +0000
Received: by mail-il1-f195.google.com with SMTP id j69so21029978ila.11;
 Tue, 31 Mar 2020 15:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gwWUAkb8abOTifbHiNXnwsQ9Dtd0p1eR1MIaYvko6Eo=;
 b=KeUu15gCaivBr6f4tnmO77/5As4DRscTtixis8IByNTyBVEpTIcS9m+FRuzxM4hLEn
 GDqi3Eo/9G5av+fyKkTHbfy7wVvBiJJUi9S+aUpexDuI8vlSQOwDJEjUzLQXnRmvbwYt
 Cos4H6ph6C6ROsutDJanDkODiMDv6HSwEhteEZJnplXhO4D6ZPoGh8ADJsczH8dKeQ6E
 QRK/uHg3M2gZSNOO6HxImFeSiN9HQVTbpEqssWUqfzc77Zzto9j4PNgbNDktyxq2d2G4
 QtWw3Yb4fMkMX/ChI/TYjcXqQBRCptAp0WmIFq1o8HnPYjcl8S4ytzUTSFimH/WGuc/v
 D14g==
X-Gm-Message-State: ANhLgQ2tNRvDo6ohh7bWEMjkyc8y/Op0z3LC9/4OxwHigmjhflajZwcz
 Ep5wz+PGexJRhHH/8AENvMlbHjN8fw==
X-Google-Smtp-Source: ADFU+vtDNeOnim0HaWP5CQDpX6NvB9k8NLTc28IoNQAKLHA3sOrQLqnEllJxTDgRB6tbM1TZC74HUw==
X-Received: by 2002:a92:5bd7:: with SMTP id c84mr19057734ilg.26.1585692440128; 
 Tue, 31 Mar 2020 15:07:20 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id g78sm50132ild.36.2020.03.31.15.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 15:07:19 -0700 (PDT)
Received: (nullmailer pid 32334 invoked by uid 1000);
 Tue, 31 Mar 2020 22:07:18 -0000
Date: Tue, 31 Mar 2020 16:07:18 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] dt-bindings: display: meson-vpu: fix indentation of
 reg-names' "items"
Message-ID: <20200331220718.GA32235@bogus>
References: <20200328004157.1259385-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200328004157.1259385-1-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_150720_830991_7ED4C7FD 
X-CRM114-Status: UNSURE (   9.21  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, narmstrong@baylibre.com,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, robh+dt@kernel.org,
 daniel@ffwll.ch, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 28 Mar 2020 01:41:57 +0100, Martin Blumenstingl wrote:
> Use two spaces for indentation instead of one to be consistent with the
> rest of the file. No functional changes.
> 
> Fixes: 6b9ebf1e0e678b ("dt-bindings: display: amlogic, meson-vpu: convert to yaml")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../devicetree/bindings/display/amlogic,meson-vpu.yaml      | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Applied, thanks.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
