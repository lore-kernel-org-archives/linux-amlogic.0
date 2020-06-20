Return-Path: <SRS0=BR63=AB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BDAC433DF
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 16:17:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4929C23E56
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 16:17:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sQQ1wDIo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gi2YfXtC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4929C23E56
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ZLbQNs5fPy0Q67Z0+QB8E10j1DLELkBr7KPmAlEsKQ=; b=sQQ1wDIof0kqLU
	CbHt5wnUypRFxWgFmoCcrtklGv8UHRCOX/R4NDngWvG0DicqSeCYPe8eq+dHbc7QSUGT+y9yJsFPx
	EqmVxSKH58jvy3xSsOdyXhhUpXmgrrzl6zwLKZCIypX4CTknxZHAMUxwCdpzdepli2AaNTTMsIplc
	QBs6d0Niz5tdRShq11IcU4tP/YVNvrNMJszbCic8+3LnwJkeYd2zswLc2l43J5L5OHBtgkJxN4L8f
	yborRioztLSPmRmtxfBca8dLIwmAUg4HHl0aJ9nZ95nnhnvJBNCyUB3RFMCkIrcTMlCYCovb51hC1
	b048uLJTRo/Ncx+mJ/6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmgB4-00041g-2u; Sat, 20 Jun 2020 16:17:10 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmgB1-000419-9Z; Sat, 20 Jun 2020 16:17:08 +0000
Received: by mail-ej1-x642.google.com with SMTP id k11so13551425ejr.9;
 Sat, 20 Jun 2020 09:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RvAgfTjcXFkPSa91lOsTKSl91buywUzLiGuCcM3OEbA=;
 b=gi2YfXtC+YREyXAAYGSXxMWJxvI6mIcBKWaR+AivlxT4pnDYEAMJEUF0rZDluwWiBr
 v6/t2PpA/6IyAm+vOLYNga7+eusqNP2nldIUsg51JJVgN86NeYgeVhkbBvoJVgcKDKxb
 m4SP9kPMLrIn2x69BfVi36HmZHRTSFgMqq/fWjN91tuPt+xB99IdICtEQt34aQZmSQB5
 RGqodhJsrDe1ysoc/P6T+zgfisR9JisPWNFFSCHiNlOvK7+8LuBFSjPKge4WMdOC2pax
 h/BRKQaqW+mtm1L7CyLz3KP4h/rII4a32OAuO5S1XNxvv6F0klHRxiz5tbGwmcg4sm16
 gIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RvAgfTjcXFkPSa91lOsTKSl91buywUzLiGuCcM3OEbA=;
 b=FpGJRdpHvSwHfIhyycEvOUCzy/+wCgnxuLFf7YIYO3H93BIGztw1xRd7ZZ+TPMDauz
 9uwyviLf0q5XfxprImXBzns675URJQqXtVtMPqSQP0SbTteNrwcJdJ4gzui21okLCpt1
 17in9HYFkP4vKxLNomIPyywgi8w+abD9uOFOQpGOtV5RC0nIbEfDSd6CT5Nhm4F+Btfl
 yEhwOGPtAnRBfGNIMxA5SOyPDuvZAwp9aKF1i4h8U8grYJG8kTjCzt4KkPKNDOqg45gm
 Cs3HL1gEO11CNL6UIE1kk0kQFN0XB/ceZL69duX+UNeJ4YBJDUJHYk1mPslrueEPFWmO
 9kAg==
X-Gm-Message-State: AOAM530IAPGjzrp0Op4QZDtFcHAPUuTK6FP3zd0rGU+NByUJNsv5ky5V
 wO7ChrEtLa/Y3VVtGjNT9AQKJuazdsrbhqBShWI=
X-Google-Smtp-Source: ABdhPJwXyZk4gt0IG21r86cM0zaWKEIEo8piLpgi4sSOy5EXnN2eNTfyAa1yrtDj6XFepQ9HIsK2QLzMZL0k0T5E5aw=
X-Received: by 2002:a17:906:254f:: with SMTP id
 j15mr8383777ejb.162.1592669826117; 
 Sat, 20 Jun 2020 09:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200620160136.21584-1-martin.blumenstingl@googlemail.com>
 <20200620161426.GR304147@lunn.ch>
In-Reply-To: <20200620161426.GR304147@lunn.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 20 Jun 2020 18:16:54 +0200
Message-ID: <CAFBinCBg3M4xz9w-M17hbiYTrMBPiDdE3RsjJsGTvJ7G_BTVjg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: Add the Ethernet "timing-adjustment"
 clock
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200620_091707_352720_FBDEE7C6 
X-CRM114-Status: UNSURE (   9.11  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Andrew,

On Sat, Jun 20, 2020 at 6:14 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sat, Jun 20, 2020 at 06:01:36PM +0200, Martin Blumenstingl wrote:
> > Add the "timing-adjusment" clock now that we now that this is connected
> > to the PRG_ETHERNET registers. It is used internally to generate the
> > RGMII RX delay no the MAC side (if needed).
>
> s/no/on
>
> Sort of typ0 i make :-)
good catch, thanks!

while going through this I also noticed that there's a typ0 in
"timing-adjustment" (in the commit message only) and the word "know".
I'll fix all of this and re-send


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
