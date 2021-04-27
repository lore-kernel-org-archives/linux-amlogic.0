Return-Path: <SRS0=DSzN=JY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF7CC433ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Apr 2021 18:32:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C748C613EE
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Apr 2021 18:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C748C613EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9bzaZSLCx8KgwNYldB3xVI3CeCTdS+5HIdJyurx6guY=; b=bgW3Xi75z5z9KWG0AMZW26V/h
	1rFqPj3EUGSVHR96FZ8IJY5tVSlsoSSZYMo4CGcCDLGXBcAWluPbYjwc3Dwb4qaqfybcZZATrhun9
	PyKWdBYcArwVuCAsXmwd7Tz4L2vyqjSqZwiN4hF9D/YQ+1qOMnJDsANw3mb23ZU8KCqlpvG+l8G61
	7yb5IcQmkYUFbEm4FoHYZu+2WzimNcac62gynnC+1w/AnXHREUCrN4c7oeikJcm2twd/qJitg3Eac
	8OoNOf4SbZh4pZIQIQtj71olr3zLkrhHDanmktmOcyifENZy8Szt4knzHcqeV7scMfgeV13J2f7hD
	1aGY6PB/g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbSVA-0023UM-1C; Tue, 27 Apr 2021 18:32:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbSUy-0023TJ-42; Tue, 27 Apr 2021 18:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yP8Pg85AED61BqhqzNQSCQ0faSITOU8hZLsSfGgXVOI=; b=OBh9MnZ8TiYqGXHP6SpmQwQO/P
 6fy/1fdY25qaxpmGVsNVyQs695/RSHINVNrXMIjuSYU1E2rAQgKqfZ1ECkU6gyfMokPJh448HMANt
 kmXIRfnp9SQgy0EatkR441IM8lMpqFDpS2BGqxwlgQcz1opfc+lgVFolAa46Ulq7XCO5kGMVQk6AF
 a61915ZjQ1J7WaZKRJyGd1juCH9RKKgdDpx2rfqhiIMcZnYOOCS8UidxM3nnj678TE4JTqpzze0jG
 kDvigNUJejRgP9MOxdeyjwNu/XMXgN9uhdyVmDK7LeNL4epEza1Q5dYdfGDI6BtcYpNP0GhN1ZyXZ
 VETdYn6g==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbSUs-00Gv4p-SS; Tue, 27 Apr 2021 18:31:48 +0000
Received: by mail-ej1-x629.google.com with SMTP id n21so14694100eji.1;
 Tue, 27 Apr 2021 11:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yP8Pg85AED61BqhqzNQSCQ0faSITOU8hZLsSfGgXVOI=;
 b=Fy0hFkhHdXOk6yDtyoFq2hpSjC2aPWKhwCUYU4Ngri+zPpxVzbpyewbCqH3tjAkYbq
 5S8mka9eS6l+NXKKHoWG1iHDryXEx4R2QbJetJE5k6O50085xzoUwcNZOjri6P/lGsBs
 6JJ8Fzjavcm+8S/wfKBz13ODN4crmC4es63WQug0kl7D2TJeofmlbj5wLY5z1M5DqLIL
 SZG+sHGcDVqFrLEGGVrMOnW2Zrq9sX/NLH737S2vncdlREg0/yu2VD2zVNIJvATYEZeg
 vj3aOqpICxCKlUrUufYUBN99s7ux4VYxk3qk/km3vALkxhGTQVRYRD6S549mn9GBBYFR
 rMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yP8Pg85AED61BqhqzNQSCQ0faSITOU8hZLsSfGgXVOI=;
 b=pYVAUDANSJiM32w5mUh5DsEAGUIbL36t2hvz5LvHA0lS5d63bdm5L7qKgkTchUdydg
 0wAUwyvvXHDYYY0re7hPyvquqtDGl17Ju5WhyknDJ2YdE3SI/Apn8+SI1zg/gcyYwET4
 iOu2v2q/qaIwZhI1UWxS9bPI2GVmalN52nkNoAwrfxr9kY/fbpELS1jeAmVCvYDPQG0J
 53sQKcov/DtPmfi5yEhFnVx+Qtuypm3KsaKiwsBJrxhL48N8bGiIc9k4pzaFKqRrisLI
 /zbNpan2cxZhKiOy+Pz0SYz/piM6Mis7hGtzRpQGve+8amIQ/tXurDsWSu+6v+QYHaOt
 ea9w==
X-Gm-Message-State: AOAM530bGrnhUaDfL4MXBAHq/ziT7ucpkiXZBeuncYytLdcV8jg8S1cL
 h0PZzRku+t3x78DPbEYyH5QB/xeM9LVNh3ZQajI=
X-Google-Smtp-Source: ABdhPJxt3MTXfyv2Bb27hy8HvPNMjivT0PcIdJJZ28HezJTgD7aAL2CIuSK4XOFdNJe4UW7aoMyJeUd6XUwDEuHlVuw=
X-Received: by 2002:a17:907:765b:: with SMTP id
 kj27mr9390423ejc.537.1619548304673; 
 Tue, 27 Apr 2021 11:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210426101106.9122-1-colin.king@canonical.com>
In-Reply-To: <20210426101106.9122-1-colin.king@canonical.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 27 Apr 2021 20:31:33 +0200
Message-ID: <CAFBinCBh1_s7NDpOZjuO3hKcvimwiD+2X15JY3CqeDKg8wemSQ@mail.gmail.com>
Subject: Re: [PATCH] serial: meson: remove redundant initialization of
 variable id
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_113146_959317_983C55EB 
X-CRM114-Status: GOOD (  11.83  )
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

On Mon, Apr 26, 2021 at 12:11 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable id being initialized with a value that is never read
> and it is being updated later with a new value. The initialization is
> redundant and can be removed. Since id is just being used in a for-loop
> inside a local scope, move the declaration of id to that scope.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
