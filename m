Return-Path: <SRS0=VErV=K5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2294DC47082
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jun 2021 18:10:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD77560FE7
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jun 2021 18:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD77560FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vZ50f9fGCG+nJYEKeq17aTuqix/qJ8WBcZ+F7YN/OTE=; b=ij4L7Nr8OAN8P0
	PWAkB0silCDBvEAdn3kPDIlXHkuns7JpMNLtft90ptcMnHmM5q/nEKQ/sMz/5He2OblQr6/DQhq4T
	+4p0N/Iui//8d0UcRg35pWCydbvqLUmnZSLC2CSPPc/dMSnoyKNYCOXFCYQ4+zUAtmTf+T+2qyLAu
	zPB0W5LCzjIRrISq8xbm5gC0qiuknC9KLdX2e2C01DI6LV3PJndpyVLgytkXiRVEnh060GJESicO/
	HfGsLZg9VBD6RvjFWmlN7MLOhdqOT5+gmaMmSMsrUh6xGUfsRgGMAxF7cF5aYl35w6/XgMRyTZd+7
	y7gkH7XUex4vjdx4+36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lorn9-00A412-Kd; Thu, 03 Jun 2021 18:10:03 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lorn6-00A3yF-Ar; Thu, 03 Jun 2021 18:10:01 +0000
Received: by mail-ej1-f50.google.com with SMTP id l1so10588185ejb.6;
 Thu, 03 Jun 2021 11:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fqJApWu3yIryGJ94oPzmcdVCCRZ+Rf69VMmTDQgilrQ=;
 b=cgxatrGN1cAAij5lL/nKJzH8NJCp3ytP4HZKltOYA1fzm8r+kdwfBis4k1uuG8T0Yq
 58FLjUrbPOm5W9XAs9V7OB9gvb+eTf14guyyCepsLV+EJqel5uZkiNUmbxcHhejZFrHT
 ekhkHrSoRwqfjn8ZO4MduHAkrh0+DNaYZX42JZE50UTjFTehMZ4pysaB1HCjUKJDzR65
 IP1RX2x6XyXdN5j6pfTMLicnNGZY5VpccoAepBH+AXUjotDAQkqxG3NV495IaShXZpAi
 mp8rze+UcFnT0ZTaKFlTUGr5dwR0N5eTgEH80huLI4SCVHn2NDRU8tmJrDJBUUZr/X28
 WcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fqJApWu3yIryGJ94oPzmcdVCCRZ+Rf69VMmTDQgilrQ=;
 b=VWbyYCFLH+X2DVlZYaeVMrwwzAkd4DGLMLcAhWlFmNHnjGIqRObuY3Dg2s3eoQe3sK
 uYLy6vslXpGEYTxD/Pi5CwEwKO3a3T1NTm6QgA0nIaTSyFiVD9+KonAVoLc/z4CzmpkA
 DOxC95t/rrwBZxf5NrlWKyv+egcByyjr0zvm/ZXg+r9Zd7Yk1WMMGJsjvWjSdU3gyx5F
 53jWqBA41nfa+QMiQLZdQk+lxUksu/rTn4ZU2subDLOcuJJdd59wxZOn3JhJYp3/3kg+
 STiX6YFi9H5LTIn07YHVPtJD7W224q32yDEWj3jO7+4EGiVvUMpK8ufY6QYobY9MShJU
 08wA==
X-Gm-Message-State: AOAM531EieP88OHxZLk1G75Smij8eePyg+1ByL9vG2gUcaI9BbwZ4vrb
 fwaJa8zAH8qHJ9neXORPzamtOFjNdntmlR3MeAx6XiLi7B4=
X-Google-Smtp-Source: ABdhPJwOK+Ce5Tm63Qqo/klQZ5xpJAMOHqsnp7E6PqDLVTnzCOcNae/hg6EDF3ZdFX2BYpQoKi37TTVnHc13QNm4qiY=
X-Received: by 2002:a17:906:56ca:: with SMTP id
 an10mr584760ejc.328.1622743736953; 
 Thu, 03 Jun 2021 11:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210601090140.261768-1-narmstrong@baylibre.com>
 <20210601090140.261768-6-narmstrong@baylibre.com>
In-Reply-To: <20210601090140.261768-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 3 Jun 2021 20:08:46 +0200
Message-ID: <CAFBinCBjX04=r1Xs_7ef4cy56zXqpQuqnGtK=F=v1E7fRZgr+w@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: meson-sm1-odroid-hc4: add regulators
 controlled by GPIOH_8
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, tobetter@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_111000_396593_D5E3AA25 
X-CRM114-Status: UNSURE (   9.64  )
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

On Tue, Jun 1, 2021 at 11:01 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> As described in the HC4 schematics, GPIOH_8 controls the USB 5V and 12V
> regulators used to power the SATA drives.
>
> And is set as Open Drain since this GPIO doesn't support Push-Pull.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
