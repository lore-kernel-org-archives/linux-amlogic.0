Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C69C636CC
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Feb 2023 11:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IR/WpVU1Sioj+9UAE2sgzi5QQnU/fQm2mgM8FqS3HM4=; b=O8imY7VOPfdC9w
	A7TFnpZlrAoQO1FxTlmskE2aFkjiQDew9sr9SHviCtbQrQVhrO1HfMhGlG0TwYyKyjYBmmRpP4QvS
	hgNB7w5cJDnPmdUD8gs//E3CLR8TViI9KqxQeyPFKs8QxqwGpRqzaxGQQ8N7Cs7UyAwqvWvXVDutw
	zRwgYFyRr9Ku8AFuCC5rFatVQXcgz+Hi1AS8HymxSoCD28yjMurh9aujPhaCEBcqFaeO9a9CRhuda
	pS1EgUHmkBB2XIM3pnrNzP0OKb/DvRnv/9el9c2Uq5YZ+pQLBZumIZliVPTAOeCDTqRhbwOQ+w08I
	a1DECf4DLgCtlaSR4OVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScDD-009t8U-9Q; Thu, 16 Feb 2023 11:14:03 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScCm-009svC-8Q
	for linux-amlogic@lists.infradead.org; Thu, 16 Feb 2023 11:13:38 +0000
Received: by mail-pg1-x531.google.com with SMTP id n2so1042123pgb.2
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Feb 2023 03:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+kR6wh9kwB/E7vRE8CyQpd6LBLK+EqxdavmtcVlfOZ4=;
        b=Sg+fQUNTyvr2FucvVuiPGyKptOmkutRklwZcQ74bdCjoB9dKmwUe+O3dHg1bLL+WbM
         GLPXT2Oc1YhiCN9bgWt87QXsZKMzqs17B5ZeOxieV8XDjAghFZ7kj89SMUk1tGTSVVLS
         cqgsFggPkidPlijzDql9Bvzljqp6ILWyqSrcH7KmXSaCAmQDqlxaRTsoper6rS+554Pm
         arcq3zT/m5Ag2IUxtufCw0B0kqN3hjcsXJAj1gOIBUtGTJX3XMPyAQi6BrsajIHRS89c
         GKGLBn4dER1Z42cJLAcUF48Jwzb1eHHaomFk7FJ0WFQ1tCdUt0QVD7tmxYdn0NaWChIl
         N0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kR6wh9kwB/E7vRE8CyQpd6LBLK+EqxdavmtcVlfOZ4=;
        b=xcd3m60a6hObKVtMmtNObOI0goi+MeIs5FM3ZZThxy/4q1LibD2Nnu13943WBpCCBh
         Cblxf8BGmP9zGJW3QLZAHfd7iaMc6mOVNFCeQGNUi7zOM1npBlTlqlnXgGs1R2e4HWud
         7FV7wEB29fDOdU2NU3vboWxx3h/lPqfqsLkrTLU4+Z4FPOEU6OL3S3LYJSqcG7rCAv8V
         4ZWkBYol9/ynlQdySV2nJVSTsQaS8K78jHvEByE00WEQN2Px1naprjOZrClL5DbC2kh7
         KnkXQobAouODz/B1fR0RX2qxnQbTHinPHfSJyiXYjgieGZbd9VVZru+QOAIZxSHTJODe
         b8Fg==
X-Gm-Message-State: AO0yUKWnG9dAFGIWqg3WEGEunnsWnGd5OVB/pE4du502ydQAfU0kgw2X
	wN/fl8sY7IF3fyQ1eH0n1R4GqEf8pSiEcH67P9fTaA==
X-Google-Smtp-Source: AK7set8RryQsbu+Kkw2qXt9myeqZ9YL9Pbk5ABXe5VqKD9hgnrBVz34nN6cjKsGVChY53slLb8UDby66Y68qOCd2T+k=
X-Received: by 2002:a62:820f:0:b0:5a9:b28f:626c with SMTP id
 w15-20020a62820f000000b005a9b28f626cmr71691pfd.56.1676546012974; Thu, 16 Feb
 2023 03:13:32 -0800 (PST)
MIME-Version: 1.0
References: <15df9ef0-9b73-ca5a-d3cf-0585cd135bc5@gmail.com>
 <1c5996a5-491f-39d6-b120-bbef86473729@gmail.com> <b87003f6-02a8-64fc-80fb-b90ca6bec37c@linaro.org>
 <723119a3-7c7f-6447-254e-bc340a1fe2de@gmail.com> <8e9d4c8a-40e0-65ef-ba72-ee8d1114ce97@linaro.org>
 <eef6172c-6d74-16e2-bde2-324227ca174c@gmail.com> <bcd24667-731d-8a6c-82aa-4763d033741a@gmail.com>
In-Reply-To: <bcd24667-731d-8a6c-82aa-4763d033741a@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 16 Feb 2023 12:12:56 +0100
Message-ID: <CAPDyKFr4aczSaAWdaX0VS+v5sGyGgktYzUGxQKdwvCfWFj8AVw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: mmc: meson-gx: support specifying cd interrupt
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_031336_317918_62CA5637 
X-CRM114-Status: GOOD (  16.44  )
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

On Thu, 16 Feb 2023 at 10:49, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> On 16.02.2023 10:41, Heiner Kallweit wrote:
> > On 16.02.2023 10:34, Krzysztof Kozlowski wrote:
> >> On 16/02/2023 10:29, Heiner Kallweit wrote:
> >>> On 16.02.2023 10:18, Krzysztof Kozlowski wrote:
> >>>> On 14/02/2023 22:42, Heiner Kallweit wrote:
> >>>>> Support passing a second interrupt as card detect interrupt.
> >>>>>
> >>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >>>>> ---
> >>>>>  Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 2 +-
> >>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> >>>>> index 46e235bf2..c8c30300d 100644
> >>>>> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> >>>>> @@ -28,7 +28,7 @@ properties:
> >>>>>      maxItems: 1
> >>>>>
> >>>>>    interrupts:
> >>>>> -    maxItems: 1
> >>>>> +    maxItems: 2
> >>>>
> >>>> Wait, you now *require* (not support) cd interrupt, so this looks like
> >>>> ABI break.
> >>>>
> >>> The second interrupt is optional. If not provided MMC core falls back to
> >>> cd polling.
> >>
> >> It is not. Your binding requires it. Did you test it on DTS without the
> >> second interrupt?
> >>
> > You're right, the binding misses a minItems 1. I'll add that and the
> > interrupt description.
> >
> Ulf,
> do you require an add-on patch that fixes the binding issue or a
> replacement patch?

Please send an incremental patch on top, I would like to avoid any
further rebase at this late in the release cycle.

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
