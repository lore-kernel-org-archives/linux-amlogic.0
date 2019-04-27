Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18275C43219
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:18:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA8002077B
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:18:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DbA/y+D0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JwWXoppa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA8002077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hdGST3dHXwtRNuXZQD5o69WWpgkMA5A216SfeXgVMck=; b=DbA/y+D0iko92q
	eBzsNECEau4ECmI/z4b2hpgHvzYPB7ta8fOtujGJfRInXIUfP+oOt0w9PmbqknztA+DXm21Ip/C5b
	CRlt7uloPDnuBXl0Mk1kH25YEPsvrSPaEh5zxxamW9GLjALuWN4s0kSfF2HEdSX+yX2Y8jtPW+L8X
	vkuflpRXVj72eSenYkdY9Hr1sDv9XPBCkvW3+sT18kUv4VDt/a5oXcWADVrFW4z/8KqOG9Yv3johk
	3rEbyN2FN0Ey2D3SNYZGuxvLgD9ljfUYVFCjaxk0p4IhT2Ft6xJfK7jXk0qZSf8PAttAbm9vyclJw
	sMRheN4mg0GWJersZzfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKTmd-0000Ws-3S; Sat, 27 Apr 2019 20:18:51 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKTma-0000WQ-Iv; Sat, 27 Apr 2019 20:18:49 +0000
Received: by mail-ot1-x344.google.com with SMTP id g8so4508783otl.8;
 Sat, 27 Apr 2019 13:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=twUn9tNCSqAO/LrZW7/v2g0R5QVO38tE+guDykXOQXg=;
 b=JwWXoppaPfjp8CMQp3BSi9WZ+Pzxhd74Yddyg81FymbGqWd4EmAEvX1MLsuFEGV5J0
 tDD/7KCTlPuKhAYDFth/I9+U8ih025ukIl7os5NEsRvcMhSE3Goh2235sfb0PXpPyK2M
 S0jnP3SQnLG3FjMugx0ggIHu2h4oHmlmvzAoFySJxNwbVy2enofTc+NRsYHQH7uFUWUu
 hb5dmMnyT7lnsWLHbez6YbTQ9R5j9H4JzMjygZgVm7YSUpwWUWiAqT7tk1EuVLWlQInr
 94nwC7zYRoxzlkJZxLDDsZNLqasuJSG7jyhNqyqvqOdupiiTO9Db+t5xXMVn5tC8LIJy
 ltbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=twUn9tNCSqAO/LrZW7/v2g0R5QVO38tE+guDykXOQXg=;
 b=YHYfrMIKhZGKj7l5sf9q0D5PaV//L5TLccz3wnT8sahzlO5aJVR0iz1QdbCOfHSayv
 vFzGjRLXP3fD+VsIyhdVO4HEoQbH156YApWR0upuncjJWNTRZObhTbjVpC5xLA9UBHaj
 Vu305IqHyb8mxwg7f6XWrk6s7L5D6sDXJ52Jm5w1TFmndNSKUqXJPTsRTkzdZ/ch3bHR
 YxjtItpleAUlX3kh73X59YOcbSFRSAvvHOOrYkW0c/3xvPh8f5yB7g/l1lmWKcaHbjgd
 5vQkfHDVQFXVbjw+S8CKje3OSbsNVb6geODYBZLu3kihhtZHfVw517bYWKoXVkvOScs3
 X3qg==
X-Gm-Message-State: APjAAAVV6YVxicIIJTJi5//UA1WGqtfpHY9ObCQjis5QpQ76AwH8qkgP
 0hbLdL9lb7w9Yol/LJXw82F5T6FWn3vWrgqM9tU=
X-Google-Smtp-Source: APXvYqzK2zosCn+VdAEkx740ufgWCPVDzpsEQ/2ZYaMULtPACgGqgWIHmO7qGAzt2uNh89LOVX0U5GsmbU7Wspt45nc=
X-Received: by 2002:a9d:3db4:: with SMTP id l49mr32891026otc.131.1556396327567; 
 Sat, 27 Apr 2019 13:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190423091503.10847-1-narmstrong@baylibre.com>
 <20190423091503.10847-2-narmstrong@baylibre.com>
In-Reply-To: <20190423091503.10847-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 27 Apr 2019 22:18:36 +0200
Message-ID: <CAFBinCCV6DWFM-nynSUGGmdvo1R6Lfno7V4d2+Fc17iS3+DSig@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: clk: meson: add g12b periph clock
 controller bindings
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_131848_679414_C7557504 
X-CRM114-Status: UNSURE (   9.88  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Apr 23, 2019 at 11:15 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This patch adds the specific Amlogic G12B clock driver compatible.
>
> G12B clock driver is very close, the main differences are :
> - the clock tree is duplicated for the both clusters, and the
>   SYS_PLL are swapped between the clusters
> - G12A has additional clocks like for CSI an other components
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
