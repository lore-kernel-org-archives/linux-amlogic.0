Return-Path: <SRS0=sHZR=43=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C601C10DCE
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Mar 2020 22:03:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33E012253D
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Mar 2020 22:03:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ukuUWKkb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="I20JsyOJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33E012253D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDiVj+ULlkKv8HW5VZ6yCIT4AzmOWcbGeEkBfN53/10=; b=ukuUWKkbM8xMEZ
	1Xpi9T91eZJnh+O+UEOa4n+y+e3Io1vmefAoEk7HaHl45UJyfpju7r7CTTUSkj0nOKI5emz0d1pir
	xbLiQTnWpJJjQSeGqghd5CrG04/19nKYtfJKYdq1dm0U2OOub3O34ppZq0iRS6ZThVyKWBOY/srKC
	Mov4ug3H8HFLGXfblkfXVP/a/1Q0dgJy0gWoSm2S4WpF4TK/jAnXQMNjISMzA7YfKGGO3eguaXGpe
	iCqWnZHQ1p9gmxQ5Y/yuA0ntAzx869F5HSWOrj8F+67AWVj7TeAUUnqdBP7VRKZk7HhH920LcdoCM
	UBAdqRJzHNC338h67RWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBmyC-0003xw-P6; Tue, 10 Mar 2020 22:03:24 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBmy8-0003wp-Rw
 for linux-amlogic@lists.infradead.org; Tue, 10 Mar 2020 22:03:23 +0000
Received: by mail-wm1-x341.google.com with SMTP id 25so3141233wmk.3
 for <linux-amlogic@lists.infradead.org>; Tue, 10 Mar 2020 15:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=dYEP1uE4NnVFr/AeDKddTWSxJgA20EPFg2G+JAahXU0=;
 b=I20JsyOJIesiZZQ8aV/IdyM+r4UI4cQUwV9OU88GjMqXQdcGxyWCcTu+TKnMpQTwzR
 8zsRR1Ku3VvKEiqj1/PL8R5Nrk6wcQBvAnxyWKr7fOA7HdZ08IH0zfDTMBnRXrE4sv+B
 1FJbyCwTIoyCOqD2c6zdL2IiWQINHKswybaSp4LQ7NJ/mx5atiVaaCA7KJmFqkI1NxgO
 ZLyx0BgypSHUQzKXHvqeJWj1ZAU41f5jkODNqWwySdRgLuSbY/bjut3UAN1jCydVdFW5
 4q0nzPNiNsFhSQ2UmsMYO7SYzoSm7Xv0C8TZTspbL4HFRap19/7Ybum6IG+LQMJ662fW
 FIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=dYEP1uE4NnVFr/AeDKddTWSxJgA20EPFg2G+JAahXU0=;
 b=lsX9a0lPjfah6T8gSb3f+QKlQxjfEvA1hO6gHTAIBKsuoJkG2QdNP3EYj/V5l7cyEW
 Q0lMVCuUez410l283Wu1HSpeAUHHO6hfQ3KTVIYi2OWEO4BYh4EhfYBcNdA3A7Oq9BSn
 Va5Iv5f9O95uHVPxl1fHei+8QqrZaRIJIMuvuCO5sCxMfNOYRa2biKUs4KybOjm/yYN6
 VZD21cJIig+aQskXur6uk46w6vQJCPleiJl004r3dW4hM/nX5vanOPYLAzbrORpm1z/W
 iL5qJ5tVCR1sy5JXjj8bsEEpYnrl1LS2gHbd3sleDB3H/S0JUsHmGxdPacuLSqmhBDZs
 qiLw==
X-Gm-Message-State: ANhLgQ0mWYlXqWgV9b8b6ov3qMvKP5Ay5gYT7OIXxTrEQDf8UHpzeLyy
 v2EQ0tDIjLY7bO/bWWRkKxjGLA==
X-Google-Smtp-Source: ADFU+vsFsnumgp9VoOGVYqCrNLZ5ay6csw80CWgZBfUy0rM6bs6wjkEgt0Ofqq4WtgfmKA4Ub4RhiQ==
X-Received: by 2002:a1c:4e14:: with SMTP id g20mr3853268wmh.143.1583877798471; 
 Tue, 10 Mar 2020 15:03:18 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id w67sm1892315wmb.41.2020.03.10.15.03.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 Mar 2020 15:03:17 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: power: Fix dt_binding_check error
In-Reply-To: <CAL_JsqJAxfL_Q3HYHk_8VeefdXnhYT7kcPe3F5Gzk1Vfj+xtww@mail.gmail.com>
References: <1583164448-83438-1-git-send-email-jianxin.pan@amlogic.com>
 <7hsgiqra5x.fsf@baylibre.com>
 <CAL_JsqJAxfL_Q3HYHk_8VeefdXnhYT7kcPe3F5Gzk1Vfj+xtww@mail.gmail.com>
Date: Tue, 10 Mar 2020 15:03:15 -0700
Message-ID: <7h36afn9zw.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_150321_512491_25C74839 
X-CRM114-Status: GOOD (  13.54  )
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
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Rob Herring <robh+dt@kernel.org> writes:

> On Mon, Mar 2, 2020 at 10:31 AM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Hi Jianxin,
>>
>> Jianxin Pan <jianxin.pan@amlogic.com> writes:
>>
>> > Missing ';' in the end of secure-monitor example node.
>> >
>> > Fixes: 165b5fb294e8 ("dt-bindings: power: add Amlogic secure power domains bindings")
>> > Reported-by: Rob Herring <robh+dt@kernel.org>
>> > Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
>> > ---
>> >  Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
>> > index af32209..bc4e037 100644
>> > --- a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
>> > +++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
>> > @@ -36,5 +36,5 @@ examples:
>> >              compatible = "amlogic,meson-a1-pwrc";
>> >              #power-domain-cells = <1>;
>> >          };
>> > -    }
>> > +    };
>>
>> Thanks for the fix.  Queued for v5.7.
>>
>> @Arnd, @Olof: you can ignore this one.  I requested Jianxin to send to
>> you thinking this was a fix for something you already queued, but it's
>> not.  I'll handle it.
>
> Someone has what needs fixing queued in linux-next, but this fix is
> still not there. Somehow it seems like features show up in linux-next
> faster than fixes for SoC tree...

The fix (this patch) is queued in my 'for-next' branch which I pushed
yesterday.  I guess it missed next-20200310 but should be in tomorrow.

Kevin


[1] https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git/log/?h=for-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
