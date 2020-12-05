Return-Path: <SRS0=t4U2=FJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B23C4361A
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 13:15:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F01D23119
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 13:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F01D23119
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YocU3PMCKTpEMvcKqQJVzeXznFkCTcVFM7ogKSu50ro=; b=WaJr1Z6WEHFtIYlp8xoX/Tuqa
	U8pk5RMK89SgIGGMl18ANYU7lg+3QLxQGfKpw1+CJKhEfqx4wq6vzY+VNgXyT/L8lbpzH+dQQkMen
	p0iHyB+H4nrfpBz+vbuDTivh3NfHESgYs8ROCQq/yTOSEEDPhbvT1WY+esmDGhlStdbqyDxfkk7FC
	jZhDFEhsSQ6wjeNEgniizKKP9LdCvuFJW9cxSJZsu2ssDupe4pYfzYeqeMmgbnYsu3RbfK/4w+v3P
	gnamv6NGS3I6VGdn1icdGqYlXwrueTc/w+kqwtDGdbHu75GNp3Iut+4ivsNGRTLaZKcLrnj7HhwIa
	zh9WSDPig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klXP3-0005sf-8C; Sat, 05 Dec 2020 13:15:09 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klXOy-0005qa-6U; Sat, 05 Dec 2020 13:15:05 +0000
Received: by mail-ej1-x642.google.com with SMTP id b9so2429710ejy.0;
 Sat, 05 Dec 2020 05:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U8o7C47mB38s85XcvCijMc+zoOV85Gbl1fF1zykKK2A=;
 b=ehA4WdgUGbq22fwAm3y4OBweeMpJTXerhxaWslqQ4Vl+DM3bh/rJyncIN8TGQCJp7v
 +pONQHJ27Et8EsMYGgv05jPDXA/sFBnQreVlkiWiZbzhLPWSL2hYjIPXSbBXUYfwRpvt
 oh0Fidbh4EAkjRO6m5ghdWsD60AHB0VxL6ZpKa+YfS8N6b8LjNZMmDj7TWCqYWsh0zuS
 JxC6oIQnt3j5+jlldpVKD+obZ1z0iEsZ2vM0bPvWXZYyhcE0qlnkr5j/Crc4gqopVcTp
 eVx18QeFuQ8VvFdjMyaOn38Ymm6kMMZO6WXh96MvGD+P1CnTwO3S1xh9bSylTRhvm5JN
 83jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U8o7C47mB38s85XcvCijMc+zoOV85Gbl1fF1zykKK2A=;
 b=m4nPYNXPpAjnnwZR9dy4DTytZh+Yck3QfYm8AlzByAO1zX0yxjMe8BtGHaluucyByS
 hlch4Hzb4ft7JNIyk1tpQ6frJ3IBX+KTGVoKiA7/gK6WbeAUMlOfqBldhDOtATbckgzx
 HG2Ptw8/LvcKrKVRYSkSSWC66OSwQ31bwNfvsWnePfSajajEdo25vH4MvVT+zJXIJW1H
 XUMFTStiFwo+ZRiyQxj2rNTH8xa1Y0+tG6VQd4TRuMFy7pBLcjRY4+gqLi9NWt5qGqNY
 BieZX884f/0qufhBWiQwUv644dEspCdB1pTX2hUnUpJOgdQS+k+9lfJvEUGJvgleXKNI
 BrVA==
X-Gm-Message-State: AOAM532wlj1mgWqVYPRpm85jC0+fYCfqVBdNsr45YVXz8giS83MFZFMR
 QsGqhZPvFfRYC6UQP/PhDKBNxbSF+9H9iXxpytg=
X-Google-Smtp-Source: ABdhPJzme9AKXTJnSuYTOpepNetqcogw7CI3kypUAmJFl0nNPidR6OLesg0UxKun/7vC2Dx849caZKNINoRwmIzj+sw=
X-Received: by 2002:a17:906:71d3:: with SMTP id
 i19mr11302981ejk.187.1607174102676; 
 Sat, 05 Dec 2020 05:15:02 -0800 (PST)
MIME-Version: 1.0
References: <14754fd95378b78eb9a0a3f8b6bab13f7263c7f1.1606828668.git.stefan@agner.ch>
 <a899168379ce425b35eea4a369504fd75977bd71.1606828668.git.stefan@agner.ch>
In-Reply-To: <a899168379ce425b35eea4a369504fd75977bd71.1606828668.git.stefan@agner.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 5 Dec 2020 14:14:51 +0100
Message-ID: <CAFBinCAdQ7PdJ8OpM9iu2fM_7C7KEbWoP9UaFya+uA-ktUs4eg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: meson: g12b: w400: fix PHY deassert
 timing requirements
To: Stefan Agner <stefan@agner.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_081504_322844_41DDDD6A 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, christianshewitt@gmail.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jian.hu@amlogic.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Dec 1, 2020 at 2:21 PM Stefan Agner <stefan@agner.ch> wrote:
>
> According to the datasheet (Rev. 1.9) the RTL8211F requires at least
> 72ms "for internal circuits settling time" before accessing the PHY
> egisters. On similar boards with the same PHY this fixes an issue where
> Ethernet link would not come up when using ip link set down/up.
>
> Fixes: 2cd2310fca4c ("arm64: dts: meson-g12b-ugoos-am6: add initial device-tree")
> Signed-off-by: Stefan Agner <stefan@agner.ch>
with the "registers" typo above fixed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
