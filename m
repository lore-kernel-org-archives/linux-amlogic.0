Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED215C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:43:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B191B21871
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:43:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OXptYC3z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="nyl2/uLE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B191B21871
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFo/HrEuQVsN1ttRqB68bydpAxhHtv1srpdUi01zaSI=; b=OXptYC3z/mPXIf
	9D3SaWO3zMeJTW/chNT2CByN6PNDoZW1IdM5GuSyVAOyr4hv6FsXWd5UHXQtZw2wlCOCTyj10NF+u
	aCTyWUfkrxXzGb3VdWoHa4SYL4Hu/0fxDmbaIz+WQQEhibDa+vuInkvjvrEMOaIZWOQsrvgB35Yvw
	f9q6uhu1PGsUBfFcN2lqlioUwsUberc2kWxXjSUzzXR5r8gF77+WsBmdkZxBLLM7kAiEGnxawEniY
	xcnZ9sEkX/ZAZBOoBI6JZs7+5m2R81zkvPwdarv1U75wiebWC2UwKB+Q+HPKTAC1/9cqI0a0KM3CE
	EzsGbDlO8hDWwVNGlxEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4ubV-0007hu-91; Fri, 15 Mar 2019 21:43:01 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4ubL-0007WV-RS; Fri, 15 Mar 2019 21:42:52 +0000
Received: by mail-ot1-x342.google.com with SMTP id h7so1706926otm.2;
 Fri, 15 Mar 2019 14:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eLb8kXOdkQ+jp9qWrdVx7EI63MwcD82xghK0py4Ecbk=;
 b=nyl2/uLEiK21uySTCiFyJMU3WVcDzJxEzL+2j91q25szBTepykFemby6nz4feIlzUf
 yzlUatOOcZqgWrKNrSRQWwf/FG6hkc1Bf0X7UhunGrYRHVSME6OYU/nCwOr1KAThBXDt
 17YcSpA76BazKGqPcH2e2hQFDcQHGzXGat0zijsDIi95yAuTbFh7m0M9BdW2zVK/WuXR
 32BI2N1h3olQokpbM5AU78gplw/aHoNdApaKulWEw3/pd2oZHH+YQ6NByj+vjYq221Le
 zMYVIstOjttY0J150r4nnEnc9MhxthrE5YDH+3gVR0qKEb7PFjvM2wX6aUizbIGB1J4Z
 iPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eLb8kXOdkQ+jp9qWrdVx7EI63MwcD82xghK0py4Ecbk=;
 b=sTQnvzxA7Ut9qkkUejQOmLP4aruqupanpbILq6qlfDEeoceC46hRLAcIPNoNb22LtG
 urkCAMovZKocJqZ/nDHtLRuGg3YVj6zyo7yNdWHcllmJXoqnuK7v3MsWH/NzLByD1TUZ
 y3M5EOCrBVl/wAOpMlDMkZ0c5oDoLBmJr3bEjDngsCSAFhZxjYu9BU8OOZvHVPUUvye4
 dfL3Sh8dxGqgyZNox1CdzXH0AEiQiddqD7OTS/FJSmkVyAdJjnjSDGcLMll7BuWvMf0Z
 smKHMc4L9gEzRqNu7AWUwwhi4qN2C7gH3qObN8h5Ik5IjWKu3vKP21rZsSopHURXBaRN
 nPMQ==
X-Gm-Message-State: APjAAAWofbGuPlk5u6rnmb+MNfrJ/FgbETLMGaUaHgNy7CugarC3Wjns
 7tgFW8ddKLooTfZoBTAzduoRv+I4ztLiqsvxy6M=
X-Google-Smtp-Source: APXvYqxO3RM3CjJ54zfHnkyxobmzyR/W77uTo0ozd04IS4MdTG9wcVpvdP4ucYlWEwgyGmugkpll+s4cpRvZAC/3S94=
X-Received: by 2002:a9d:5906:: with SMTP id t6mr3611330oth.308.1552686171054; 
 Fri, 15 Mar 2019 14:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190311095613.11371-1-narmstrong@baylibre.com>
 <20190311095613.11371-4-narmstrong@baylibre.com>
In-Reply-To: <20190311095613.11371-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 15 Mar 2019 22:42:40 +0100
Message-ID: <CAFBinCAkzcY2A-YusWLMbsmQV0UpBCQJdzOncyUYSyORMkThPA@mail.gmail.com>
Subject: Re: [PATCH 03/11] arm64: dts: meson-g12a-x96-max: add uart_AO pinctrl
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_144252_067314_468DCED9 
X-CRM114-Status: UNSURE (   6.26  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 11, 2019 at 10:57 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add pinctrl on the always-enabled debug UART AO.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
