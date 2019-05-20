Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BE4C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:31:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AE34208C3
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:31:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jfY3mkdd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Zl4gAnpq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AE34208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mvTOUaaYfEjZnWkT5C9PnarCEG8qM4TFHuJYI39a5lE=; b=jfY3mkddaCfHJT
	f1juhKA2Mr6QHSwyZ+mVFYihgwN8QplSAfjoQND2tn8s81w6IEwE2xtdN6i8UDuxpJYS9sb4+sLz4
	Y8F173E0cyrvGKwYOxdKm36tOrJ8nJsOpGrUIYq5USs8W2eg9SixAvoVA4OUROBQ3v6qYw3gzJzyP
	wfW+GMW83907eXV3bUY+kXC8dBEnjkL+DAnLjy8zEEHcUsBuiFH7wW8/rd2tPHUcCEkFflAqvwYSp
	KXFt6VzlBTlPcWkgzjCUiRxPu5SamIl8Y7Dk2eoahdcbZcmYvklAV8EJjOuV7einOHuLa0Jz1XtKa
	GNKY2hqbpzK+rmaa5wzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSm8V-0005G1-Vp; Mon, 20 May 2019 17:31:43 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSm6N-0001Eh-L6
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 17:30:17 +0000
Received: by mail-ot1-x341.google.com with SMTP id n14so13762875otk.2
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 10:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MpVsPzn7fqjajsRVSaLIebq0yUptaINVy1fHJtkXPPE=;
 b=Zl4gAnpq82J5MFlntHb0LMgdoq5VDUJmwbDPgV+pzvh/R1GUJdW+JYwH3lZimVSguZ
 M8Ql72g3Sr5ruIVtEKBSvYyQ9D6/Jd5h/xypTp/2Eb2qyG2llH1yF0wrwQHGN9/W12xM
 jflYhcAs12hzCdqv9HDH8rDiUmU6+6zSni6Ed0Nke4aidDeeoqK6ZFrjtqWhw4L4/ZeW
 a5/nJYfzGgixmsy38y0di6MNhvIdwlEANel8J6OK4UxIJjZ010+w7CFwHY9HSYTkRYsp
 sAqiyXLwFjJaTYnbsGVznOGn4nBIo8JLhE5v9rXdZvHyBFYEvTmRuzsLtWA0xT+1ptSk
 Y34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MpVsPzn7fqjajsRVSaLIebq0yUptaINVy1fHJtkXPPE=;
 b=RiR8ZaIrL5DqK6PfL/4Q3XCfHDJAQRb5Sgnyoz2jW0fsAC7ybpc52aB82H3/knksSJ
 XcVbSdbD2OEtlHjoDYR5JPpZeKhZwUJ1bsZD1CHMaPQrs2IuYhsm+qDMshPTRDkSkCfo
 /YmyYM59ju72Nt1jZXjK/C6JUM5LAOoQ3a3I9yN70QRpjzCU4zJv3Sh3V6kuoIIFr/G7
 gYlH0tyGuhyjLMl5upB7NgoZ+PxbbSlY9euiV+3lJGOdZMT+NYsFJdeG4/X0NkfMD+Uf
 a8b6z5660sKjjLVY8VZdNjDAyC2rlYnq09OzowHa0N2VNZlX4d6OOvNfvw3O5wPjyuqb
 pJkg==
X-Gm-Message-State: APjAAAUjyqDeOUPCtT6Z9Iu+8POkeNn85fAwOVYHScXHS5B0BqjqYiFj
 2B9WmYj7744xZBWKbRpXq2smZu/DDDc8iR4Jeq0=
X-Google-Smtp-Source: APXvYqy4fRDdNCMFLSSJ4ARTkpXPXphsa/ThOeZsGf2fWAEnDHoL1pf0F5r3Bjtzvtx9joN495LmCIFtAQ3r2hD01c8=
X-Received: by 2002:a9d:69c8:: with SMTP id v8mr46369281oto.6.1558373369442;
 Mon, 20 May 2019 10:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190520131401.11804-1-jbrunet@baylibre.com>
 <20190520131401.11804-2-jbrunet@baylibre.com>
In-Reply-To: <20190520131401.11804-2-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 19:29:18 +0200
Message-ID: <CAFBinCDR_eYBEtbkvF3mF4VdsNuTuWEirAzViYrwVvfjYNpymQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: meson: g12a: add ethernet mac
 controller
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_102932_538321_81178A9A 
X-CRM114-Status: UNSURE (   6.14  )
X-CRM114-Notice: Please train this message.
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 3:14 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Add the synopsys ethernet mac controller embedded in the g12a SoC family.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
