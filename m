Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDE4C4321E
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 11:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDhasxdCLkK2XK8MezAa+vKIRmCowE25rUlimFa6nA0=; b=HclMIsaciRBW32
	wgkN6GWrPAfuhN884kYSMpzFmLZ/rNkV62Dbt4rfg7jWG0AZRJo6zhWqqZk+Dn2WgrIap7D3daFBH
	u1K/pY/D8MRNeyFlPR57Fjs8vXzY8vivQ/ISjQH7zvilcB+Lz0YOeAqjjbhEif8KAaDbY7sWcD9cy
	6dWCyNeQ89+3MHV0yxgtIqBkDr1JlqKoBwfCZPlqVaL9+f1WQm1QnYiVP1Qe0w/ozo8ZtDHF5LBzQ
	SFM/A86s64oIwoTVzjJvJCsMGwffgzVApU2UzlIPDtc2ZLna/acIBqqorLV/7RX8pLaILFP99+L5i
	P+v/mhNPHH8KLlBu1nNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p144q-00FwbT-EL; Fri, 02 Dec 2022 11:19:32 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p143P-00Fw3G-8F; Fri, 02 Dec 2022 11:18:05 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id C879C5FD0B;
	Fri,  2 Dec 2022 14:18:00 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1669979880;
	bh=AsaRBxee42hOS6gdGH0VdtrvLMuuq/QeYvXxggXDzIQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=f22zexFMawyFz8cRaHs5tpEi5f3iMHUDax/OjkItUa0TZaWBmGg6S+o/7URPQ2tGM
	 78CDrZUcwElvYhradNqk6jamQcHSGg4JBkWhCecjDLlj28tMn+Q/7o1Y9wehWi4LCG
	 XhXQpfSei8Bo6ebNkZY2Xdy8JjFnUjYpdK/vbGXxmk9pv85lLR5qyhFdr/qo93zDwv
	 9P6wjnc0Vq9Niy9tjZjmpgLsDcPfP96YCzbhLd8135FGOTajg/ky3YgJx+5OW842oB
	 fCDeUErSg9XD5vI5I1jrBYgG8ZksZYb6n6TRY2BNGVwjO+Csv9SjhDqZNH9gu9EfIb
	 NLhmt6LVN/l0Q==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  2 Dec 2022 14:18:00 +0300 (MSK)
Date: Fri, 2 Dec 2022 14:18:00 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jian.hu@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v8 01/11] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Message-ID: <20221202111800.e5lfnmmaxuc4ok6v@CAB-WSD-L081021>
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-2-ddrokosov@sberdevices.ru>
 <38fda078-e4d4-5172-25c7-b126282f9f88@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38fda078-e4d4-5172-25c7-b126282f9f88@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2022/12/02 07:44:00 #20636821
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_031803_509337_F2E55DD7 
X-CRM114-Status: UNSURE (   9.01  )
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

> 
> Node names should be generic.
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Thank you for the link, will change it in the next version.

> 
> > +                compatible = "amlogic,a1-pll-clkc";
> 
> Use 4 spaces for example indentation.

Good point, I've fixed it in the my patches above. But as you mentioned
in the all changes, I have to squash them....

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
