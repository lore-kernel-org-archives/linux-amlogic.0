Return-Path: <SRS0=4hoi=NT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77926C432BE
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Aug 2021 16:01:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CF5960E78
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Aug 2021 16:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CF5960E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nh9SVudGEq/TMyJL/kLfhG7XJVNlYUV6QwMq429VZgU=; b=QSis+du891AU+V
	t3aWUR9I7YffHOlAdnwGIKavK5yVsII+nxYm04Xi8j0k3+KeB0UfN0tGTXQsCTLnaAFao6QJTGXIS
	bTCz+cUmfNNg43MPO0LL3RN8wn3wCKsD2T3yiFGabw2yYgJPoCH2/TXhSIODiQCNleI2LjThu+XK5
	MOeiIJZTXXFLVo1LI9xPOu+9wo2ndBzlqUGkOSW0n8BM19cp3RhscHPx/C+GfvdMT1UjSaigNB9Uw
	rKeJoOIV4tuo12avs/8J0TZ7JfbW/dX1Z/gaOwolGGCGQ7DkJio8m3OFwSuWqNNiOkIQv1WAPszZ+
	3pv4I1nGLNLTHvDBhT3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mK0lN-00ESNo-UC; Sat, 28 Aug 2021 16:00:57 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mK0l7-00ESIp-9x; Sat, 28 Aug 2021 16:00:45 +0000
Received: by mail-ej1-x629.google.com with SMTP id ia27so20740160ejc.10;
 Sat, 28 Aug 2021 09:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q+Lu3zsplYuNKF2IF+QmpVTl2y5bBSCP+aSg8wuwsiw=;
 b=HF+xsgvsnrJrPToIAqza2r4D+a2I4uKoEWs4qUPB9ZtxE2lP61oybEuf71lmwwsehc
 chY8Av/MqB3ykfHwW0Ja5AxiiZmS4/DeXKkolm4txdYKhEzQZ5l138XMO3+VGsgrn+CR
 qwuu/5OM9ZpeW453SAUOh2G0AL+xSwJflEuEAGZTKZRElo1NZcF6YyQ3H8TiHqZmsX9W
 cIp2roGNC2b7of6WssIXw6mppEIUbFl7OvHHsaudDCz6Zt2sFliwpt/O0M5kPzE1zl1N
 756MlwT00hoeEpixvex5O9YwQCeeFTh1XN4lFUY34JKFo2eSz4EfQNcOSLu2WHn5h/N7
 mH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q+Lu3zsplYuNKF2IF+QmpVTl2y5bBSCP+aSg8wuwsiw=;
 b=lnDk1agitAQ53KVq5Rl1ZzmMCQuNtvlvBFbtXKjZ5tKKH7GctGFdEeY19CKiu4NQns
 HR8D/2cXwvGHBLPxb1RVBgmtUXW3sgEfY3DPd4ecv8xtaYfCA13ZdNtxlBPuQrslw2Qd
 orlOHey8nRqVv4udMcBwNRonyeej5P67FttnC6rN1z1/c2gburkgUp+6NR98XDou90qg
 8uqz7ypbHQOha75uGeyIgdax+bmc7bEMJv2eCPTeAwUh852reMduTVK05bLN0y0/mibG
 45vnVm1OTsJERZyzOP/PUdwRzVEWdtPPELHkW4Vz9EjtiY6LDSYYa9T4rj5uoND7T5Rw
 4eWw==
X-Gm-Message-State: AOAM532GYyupcE1UAnrj4v7rZlqD0Wv95K++KVg4wuVSfUFkKhxrW8k3
 GmGyvgylSoyzdeOKD7ECQNC5P8iIoQjP2B1GKpA=
X-Google-Smtp-Source: ABdhPJwD2vEA5j8yQQHHv0y4xe5OPRu0rQ5pLqz4tIRsU3/TzhWBp80jORvSGA8DCjkphVreH8wjKsmX3LcpVwfxUqE=
X-Received: by 2002:a17:906:369a:: with SMTP id
 a26mr15768976ejc.539.1630166438950; 
 Sat, 28 Aug 2021 09:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210817041548.1276-1-linux.amoon@gmail.com>
 <20210817041548.1276-4-linux.amoon@gmail.com>
In-Reply-To: <20210817041548.1276-4-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 28 Aug 2021 18:00:28 +0200
Message-ID: <CAFBinCAx33SnuL8n1GF8nz2Q4giNR8tsWxjU32X0wsb6kR_nhw@mail.gmail.com>
Subject: Re: [PATCHv3 3/6] arm64: dts: amlogic: odroidc2: Fix the chip enable
 signal for usb power
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Matt Corallo <oc2udbzfd@mattcorallo.com>, 
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210828_090041_407323_6C7F1670 
X-CRM114-Status: UNSURE (   8.89  )
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

Hi Anand,

On Tue, Aug 17, 2021 at 6:17 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Fix the chip enable signal changing from Active High to Active Low
> to enable input power to USB power. Also updated signal name as per
> the schematics.
according to [0] (page 12) Odroid-C2 uses an "RT9715EGB" for USB OTG power
The datasheet for that power switch [1] mentions on page page 1 that
the "E" stands for "E : 1.1A/Active High"

Can you please elaborate how you have tested this to confirm that
active low is the correct polarity?


Best regards,
Martin


[0] https://dn.odroid.com/S905/Schematic/odroid-c2_rev0.1_20150930.pdf
[1] https://www.richtek.com/assets/product_file/RT9715/DS9715-03.pdf

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
