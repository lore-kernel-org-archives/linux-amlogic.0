Return-Path: <SRS0=l/Xo=TA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98525C43219
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Apr 2019 20:03:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4862F2080C
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Apr 2019 20:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hUYryOsY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="iKHwwFm0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4862F2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9HTPGui94NjWPsgbguJKLIoM5YkiL8qAj7pfRIyR00=; b=hUYryOsYazA4D2
	xXv1BcznD115gHnxBn6KJAyQlMKE1k6PSGIVgo6oLs5rnFAII+01sbxMoSm72pCBKMjon+2+1snP/
	7tWKa+EOSKNrLikosM4T/SroKISGV5Z1NKm5Yib5XJvdpXa2b27C1usWGhRHPTnvV0LoUkD8vxE2z
	aosfJ6QYd8ZK+uJR1y/nGkwIg4k5GCEKJ+VRKB1PapgC/QWk7hnQkbF++WoqKzfeWzJncQVQPKJVF
	JcOviuuaLwib3ngLP26WqfFTJuPAS3XrWT8dmAMK5l3beKimYiT0HlHgExbaZSEFfoF0bqehyy6pH
	hvrdBimo51B81dTNTh9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLYyS-00018L-SZ; Tue, 30 Apr 2019 20:03:32 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLYyQ-00016t-Jt
 for linux-amlogic@lists.infradead.org; Tue, 30 Apr 2019 20:03:32 +0000
Received: by mail-ot1-x341.google.com with SMTP id b1so1334857otp.5
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Apr 2019 13:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tYR0s9sQkklCAWRjV7jXlmi9PCAdhd4yUnNe8GUQ6e8=;
 b=iKHwwFm0ncZW+kXAshLVCHC28psurWQTUGj9bimhWL9ha9I5gl7REkrkzB2xnO/CwN
 bhtCzdNiS+Qyfc3EjCKc6ojSA8FLnNwclGMzmxDPKoSecC2gMcHb0x07P53XyhW9SSDo
 +QAo2iGG1ndvjhk4AWqj0hr6DPCFvPrM5qpTjspc1zuCKvqtSc6S9QOFJBoB3/gdXxPd
 3BvUw9SXwNpo3dnRk9aYRq5C9D6en6VmQrhj1LD1h8bQntRro0jvOCYdDUPcAlGMPJ1K
 LciPbrOdtZhN+0cXTzFrX+MxO/IO3K1KvR1Tw98+ZXBO2p3RtpKJ6JBoX+sTtgk2aDkR
 gI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tYR0s9sQkklCAWRjV7jXlmi9PCAdhd4yUnNe8GUQ6e8=;
 b=HSJJsxEUpHhYeV2IVkEf0zay1oWal31ylB8TyQjGHNZbBDJzbqsnUcfKbOn8gDdUUS
 hmHqn+OXLwPd5YI+WIohvl/cWNc0dsNrQGxwlkM0qbFeuUGdXP7uWjiVxDOFRzAZcwdN
 I6IdkhVXXtAWFyQ7lfQnDovfM6uhSaiNvA4NqBNMHfxGspGD94C7ciBVB6UbWHswP+Lf
 qNIm4E7w5YwFMU+4fztKoaUPOpSbQ5tE+1NqgzjfzR31nxOCJH897AieEBW2p0Xm29qz
 GFXqZSBPiMZaC4GDvw/c+qx0d1eVD1w0ZYhrp8KpCTLyTZwNJuJcj4f9R+hQR42Wpz/r
 ccLw==
X-Gm-Message-State: APjAAAVAX9eLCoQO5nVHbvguNmokegk1fMqIC/0CLk//NnB1SAJH35kb
 XOW6NKCRpaM0sGTFyjW5YwdOsJDGuNS7G4wK0m8=
X-Google-Smtp-Source: APXvYqyBm/ugD3AsVu1vS25p2i9ySt1MBCq9E1dkzeWu/yECfAjSSQFEd+AL8pGvWxZi3KOl0eTrA1UI9d9UveNRt6o=
X-Received: by 2002:a9d:6759:: with SMTP id w25mr7495221otm.348.1556654606958; 
 Tue, 30 Apr 2019 13:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190423090235.17244-1-jbrunet@baylibre.com>
 <CAPDyKFoQyPKERckAdU+kkw3go=161PWc+5GAkz7y=xWMGbq+SQ@mail.gmail.com>
 <CAFBinCBGU53h9063jj8n8q3whT=eZ9y6MPaYYqU_K9UXssK_nw@mail.gmail.com>
In-Reply-To: <CAFBinCBGU53h9063jj8n8q3whT=eZ9y6MPaYYqU_K9UXssK_nw@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 30 Apr 2019 22:03:15 +0200
Message-ID: <CAFBinCC+w6aD6sSk8u=Pt54OKZuo84YMB2mWiLVHFNr329-kEg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] mmc: meson-gx: clean up and tuning update
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_130330_879460_2768DBB7 
X-CRM114-Status: GOOD (  11.89  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Ulf,

On Mon, Apr 29, 2019 at 8:40 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Ulf, Hi Kevin,
>
> On Mon, Apr 29, 2019 at 12:45 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > On Tue, 23 Apr 2019 at 11:02, Jerome Brunet <jbrunet@baylibre.com> wrote:
> > >
> > > The purpose of this series is too improve reliability of the amlogic mmc
> > > driver on new (g12a) and old ones (axg, gxl, gxbb, etc...)
> > >
> > > * The 3 first patches are just harmless clean ups.
> >
> > Applied these first three, postponing the the rest until Martin are
> > happy with all of them. Thanks!
> thank you for taking the first three patches!
> I am fine with everything except the patch description of patch 4 and
> 7 as noted here: [0]
I did not understand how HS400 works. based on Jerome's latest
explanation I'm fine with the patches as they are


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
