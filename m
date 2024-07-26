Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80E4C3DA49
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jul 2024 07:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DPw/d266HRs+JqM2ZlTCyRMgVYqronWBplrLVvh7dfo=; b=MX2PuIKJJp4xb2
	WhEO2vstjR8XWYkcPA2cnoQID3r7WIctYXR+D7e7+fiMrGkh2fxdWXrQRYoiNRCzUOnPa5hxMM2IN
	jCaa2Ec0mplMuXi2WzR7yWF3Ad4Fl/+qqXGDj7x/lvALE2z7DIq/1YhbMKkqYYIjxMtW82suE/JAa
	80D9mQcsuluBLosOAnblFQ2iIlkhJo45oliRZvHZ+wDaP3/SwD8Qq7p2piVm74GnF15muaNEfuYCZ
	3A3amJIoyW+PNMdUGuTPeO37oLT9yfrgofUUYUdCiVoaHHS8La0DCSnttvsdDcXT12udmkb1lb4m7
	eXzuVvngz1BMHl57Af1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXFKA-00000003ArX-3Y0r;
	Fri, 26 Jul 2024 07:25:10 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXFK6-00000003Ana-3U7V
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Jul 2024 07:25:08 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-79f014a53b7so22998685a.1
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Jul 2024 00:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1721978703; x=1722583503; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=avcZ0XeDvxhFCHHWnLz/cvRXaQLXwQeaSCVLcihXW2k=;
        b=yeRLeeKHrdgOouIGieWLZA9Rj8xjy6UZ8opUxySb6GAtp4MaRB3qjr++/SW+hqKK69
         B+f6JF7Tw20fW8qpPyEcn4zd/IaVbOGNeWpbxrVEdlciY4WFU70wjIo41NdabuMDkdWt
         jAX/ZZbnEcfBzvqhbUkisInKiRG4i0eeCiJfhzHUdyaZUsD9YW32XvdONOCAEQ4Cbeo2
         2zq2W/RiaLHL+z1MEUOnEp7s35Hs3E84o9tlCIruTGpYobtvsfkqzdnViB/FY0uaoXdo
         o0w4DVPMbIIJlxljoM11yLc8r0LGgA0+EqdRRETrIARqP+v+ceUOrXJmngXUGIvjwVly
         JfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721978703; x=1722583503;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avcZ0XeDvxhFCHHWnLz/cvRXaQLXwQeaSCVLcihXW2k=;
        b=Ofy8RcE4y3iRO17F4bDdipb7am6dnZvrv8m33E+XYoCnpL8FkvsIfVHMoYiiJUJAQ3
         VOdx+uEuXy8PgyYDyt3ze+PSu6D6fmtMlnIsMywk44r+a6cNmBLSqKbH63tsiQhHW3DP
         2Fh1pvjRTVHMtgmPb1GtxaCSGrVxxnRenKg/gSoQxIjYlOpsDeHy623dHdx+86t4TvaY
         Htaxg/e5eimb5KbO6ITCi52rKlIPW65aHKLsDDUqi+GyF6D+H4EF2qAcpjI0XBtvli9h
         Y735f1dyfdXWmGPl7Pji99+y06l8cFEdSOXqdRReIahLoREEsxj7wUzEjuO4anb7DWwD
         cJpA==
X-Forwarded-Encrypted: i=1; AJvYcCUWOSNp3/OiwbMhvATRUoM69aBkcBllOPrTCvWWgYXnjcZTegoSbXlI0QBuFUMcZ2/MK4U9F3E8KoCUfVgol9bRgf2e61y5DkCiRWBcz908F0A=
X-Gm-Message-State: AOJu0YxW9J0E3pON1XBTrdw9jVw9TR8vhfP03JTKvN3a6PsjdzHcwHQg
	DfF/kNCUoRpokczrKlkyZLzbtIYTFHYxMe9mmzKlXLNO3BxLIJCSdz8gc7KlKYO5kWSPYHXA17u
	jyG8tEej9fN/ou850aRVJtB/KrIVab1K2Cvik3g==
X-Google-Smtp-Source: AGHT+IEQMpCGcCv6MJDs37LwNfhYJ/aHQOmhySiSwOE4b8vVqH4/XnV6OaZWgrzn4PNCU6z/pjfP9qGkBv6/dQosuiY=
X-Received: by 2002:a05:620a:1a15:b0:79f:c9e:6269 with SMTP id
 af79cd13be357-7a1d7e8463cmr446035485a.37.1721978702356; Fri, 26 Jul 2024
 00:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240724101015.523535-1-vignesh.raman@collabora.com> <20240724101015.523535-3-vignesh.raman@collabora.com>
In-Reply-To: <20240724101015.523535-3-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 26 Jul 2024 08:24:50 +0100
Message-ID: <CAPj87rMfs+_EMyJT1PoLTXmrosDiqQy_N4VYSA+M3R5q4sit5Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/5] drm/ci: mediatek: add tests for mediatek display driver
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	deborah.brouwer@collabora.com, robdclark@gmail.com, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_002506_902231_2995ABC0 
X-CRM114-Status: UNSURE (   5.55  )
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

Hi Vignesh,

On Wed, 24 Jul 2024 at 11:11, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> +dumb_buffer@create-clear,Fail
> +dumb_buffer@create-valid-dumb,Fail
> +dumb_buffer@invalid-bpp,Fail
> +dumb_buffer@map-invalid-size,Fail
> +dumb_buffer@map-uaf,Fail
> +dumb_buffer@map-valid,Fail
> +fbdev@eof,Fail
> +fbdev@read,Fail
> +fbdev@unaligned-read,Fail

Please skip dumb_buffer and fbdev tests for all GPU-only drivers,
because those are testing display functionality.

Cheers,
Daniel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
