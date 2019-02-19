Return-Path: <SRS0=vGLM=Q2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107DDC43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Feb 2019 19:42:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCFE22146F
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Feb 2019 19:42:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZD9jozj2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCFE22146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fac7VIJa2PE09rx1VW2xex3GnKCcqIJ9gmPC455mT3s=; b=ZD9jozj2fPj339
	YDufDS2tMFWOJvB8M9rLI/qUpirkFtr/FIWZ4pnj7jQANqZ0fcTbhKerXmRr0brhXZZKU/hgAnWSx
	ak5m+RwFrfNmRkVRyeuoWsUqCRFmyZ5uTqe3f78T+/BPWBZ1JNORYLyTFH2XudP8eyYCopOGpRFGy
	onotoj3Q2zghQ1ez2EWoG3W4b9dMI7npbGyPKSmFDXrGKYprZiFgy36gvXQkBBm2ExXjrX6ii6zDO
	E4hEVusMfim2Q83DvQllzUddX5JA2FZ28hO0lYffhEWWgT9JmLUQSpu9mg4HVgrrVpk1IIOW83Dmd
	y/cmqkphSWEY5xXZjyAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwBH2-0002mA-6n; Tue, 19 Feb 2019 19:41:48 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwBGz-0002l5-FG
 for linux-amlogic@lists.infradead.org; Tue, 19 Feb 2019 19:41:47 +0000
Received: from [10.10.11.100] ([95.88.214.118]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0La2Xx-1hJihr24qL-00lotv; Tue, 19
 Feb 2019 20:41:30 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Jose Abreu <jose.abreu@synopsys.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCB1WUMOmaF6Wmr5HTutrgLOru5CRSnOpUUMMuVzHSa3Gg@mail.gmail.com>
 <330a523a-c1d6-4a99-3287-459096af0330@synopsys.com>
 <CAFBinCAJwk5Go4ZEt2cqVKyfeeOxsa-+3pfLpzQo=XNr5u4Shw@mail.gmail.com>
 <2abbf79a-cdff-b6a7-42de-79ea2c6ab367@synopsys.com>
 <c80c1e5b-fed9-25ce-eb1b-258ac0135ce7@synopsys.com>
 <7afdaa0d-d0ef-b223-1f6e-2b52bfa44784@gmx.de>
 <6f25da2b-7f28-b888-3240-7178ac75c90c@synopsys.com>
 <84fb981c-75ab-ef9e-edd6-cd0c52d9dc36@synopsys.com>
 <cd344fa3-758f-3824-ddd3-568ce837c4f7@gmx.de>
 <8bae9cd6-5c44-30e3-bfe5-8d6f853f170e@synopsys.com>
 <065407cd-c13b-e74c-7798-508650c12caf@gmx.de>
 <227be4e9-b0cc-a011-2558-71a17567246f@synopsys.com>
 <45e73e8c-a0fb-6f8f-8dc6-3aa2103fdda3@gmx.de>
 <e1d75e7f-1747-d0ce-0ee7-4fa688b90d13@synopsys.com>
 <4493b245-de93-46cd-327b-8091a3babc3a@gmx.de>
 <adafe6d7-e619-45e9-7ecb-76f003b0c7d9@synopsys.com>
 <cd0b3dec-af3f-af69-50b7-6ca6f7256900@gmx.de>
 <fa35fb4a-b9d5-9bbb-437d-47e8819d0f27@synopsys.com>
From: Simon Huelck <simonmail@gmx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=simonmail@gmx.de; prefer-encrypt=mutual; keydata=
 mQGiBD/bCNARBACE3URTBXZ/AA03NwRNtz03ewQn3uhvYSTjfqgplBtb3dfC4a79BXDRIWVX
 xPGH9Ewios1c8gMu3/RI2l3JzXoISfw5b0L/5igyPKV+sGuUA2FD27kYtPaaF/TqEWIv+Yxp
 9DCjCX5IQSYyvCfcxcyEkY8eVWxnaAlV3zKRR8wn0wCglWIOtAugBcg1YXmoLpFZE8Ca0fkD
 /jG+n4U9DPfCgkbgjQ/dv2W2a0ZDHccA9N8AW/FTXGyXXO0e7ql9/kORJnp7jD7/Z9HCKpeS
 HajgxuX9Vhfx6bH1dAMfsg88+K8pOO9oulNX1+YffQyZWOfdbmnZDUzBt9HKR9Wgh8WoIyw9
 TVluclzn6hYz+z9jbqHWMOsiCu8zA/0apHbW8vaIDT4+nNUxNdqU1TKa9kW47vNjwYYL0jZW
 TXNjDIRpqJVSugYVc/U847GoVoxyvtzre4TAbBV8h0BAOeMdxI5En67RGWzeNaMDJV1bwapj
 qdfj3e/X8rnGIfwz47rwztLNKoAIUlKrATwroiI7UNT+84G7H5qalu+Eu7QqU2ltb24gSHVl
 bGNrIDxzaW1vbi5odWVsY2tAZ29vZ2xlbWFpbC5jb20+iGIEExECACIFAlH7wL4CGyMGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEJNSVvfBt05KlBQAn1JDO7e4H3N0WFJkZnxvObhk
 2kiAAJwPdDd6T1TuGo4iDIENRhAX4AH2KrkBDQQ/2wjSEAQAj6JnDDQzIIYzPGsrHRvaq8vw
 n8VrZCbPRvkngGvtQIss5pH/MLeu9jLepDGO9WHByFSg4QJh8cINYwTLtX8Bu0naA6ZI46hn
 GyfxdRlxSU9dRqHpU3G0tymL1w3AER6aVSfdXQTmFgf61anKunbIIptkqzZurkjnxkwCE/RM
 RscABA0D/jhglpj8siSIAxs8XLVfKJrjzbYM9/wS0NfdSXBeQJiYtKrY0WMNsqjY50wDnLMg
 anORN/odT6mCwKI6xChzxEv/ta4+teZl92aitziSuqmtl+jm23DpOcUC7UBz2W1+TvnrhPR+
 MKu8pPKAgsE8AI5uwCcNJx7V3bczYkIGaXybiEYEGBECAAYFAj/bCNIACgkQk1JW98G3Tko6
 3wCfZBpZAUhUz/Rcp2rfg/YSKl4YLlEAoJN7e322OvHc2GQ9n1+tKLi6Og4c
Message-ID: <244d7c74-e0ca-a9c7-f4b0-3de7bec4024b@gmx.de>
Date: Tue, 19 Feb 2019 20:41:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <fa35fb4a-b9d5-9bbb-437d-47e8819d0f27@synopsys.com>
X-Provags-ID: V03:K1:yKMDFWiQAbylI656NyHTz5Iov1zRyTitpQil1Ur0FjQlFGE+HnM
 Bfy8klLWzXF7gyqEPHP5qTULHRoKAqX/pGc+2aTMWorIehk0MA+BDb7+NYMlsMuCzjQdgiI
 LIZtDdMap/GpKX+QEABEkBpwPorBsVDt9SKlPOj0Xn7KLBJkT7299z/BYH3oapt2oaSjDWJ
 ZSVZ9uBq8dDcpUZWb5fAA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:z2g9BQB9g5s=:dsAaqAhao590lEtqq6n15S
 JASjblOFOWxvWlli+dgbTxLk4ojUQf0Dh8DjzOoHQB3M+hUzOuyb8U5DkSZGi+FFaZ4ZXkNVG
 Kt9ld8TQjjhoy5A734QnrmGuxUx5mlJqCID9zJpO711UhTgvaGgWze0YbKn7Fey+48i5gnMLa
 mTG0eRiVnik8oZsjF6CiJnLbXB7OLFQtIuxhfZWUO1DwEyX6FjWM8lB3pR4ioBW1HHJhXzmR+
 2qHy+9dwu5PgHJfxKCpbjLE+LZ9ob23kvyfJhZHptLICJ1NX1hEC1JPTonPsQ7mJVTSUC1HVN
 iK10nu1yBu4mtVSWsPTQCuTK7fa5/+NMUOoM6pK4vDNMBHcXNpEOcIhHoRvyYez09s65fAmC5
 UYmuSZykkyUnH9odAh4nXeUg1zAJsXxMxGFzky4xslFbW5Y5fUpk4RHP34csad2WhWClrrl46
 gDIqMtEGlpHmxTlFz3HNisVI2QWbCEyRgsCJy9KvnaA+d8nQI7HFv9icvXVAquaAiRb8+JGsJ
 Sq6xi03DwKhH1XCfCpYzq6iPifuJcnmIvrwG2Sr1QOpeZGje3ZfVPSLCSvNyB+5qodwNzDjdx
 r9X6cVN+/zwfBh22fyYStrzZeT4kbwQ0HjAdQrIQobt2qv2D3fmSFUOSzfd3yCFoEL0c1bJhH
 Nl15yTKtHXSVQqI65ne+L5Ym1PFBpeSII3l0oOc8vN3YuJjfO3Zv+LBl74r411/BHVTpW9XGQ
 Mk2WXDUCDkw0TDaBxqOZ1PTc6LhTIsiLYWT0QztPWQFQgyHMgLNUOgLC6JhSUxxiRexqTtCkU
 ZyG1bge16mtvCE4Me4Mugw907KuI0sw0RJG85Z+z+J0WSTaILJew3AF61T4PTDsDWXt80ZJMH
 E0zKCFll2f9KGGR2jTIZcMMsnRY8yEMMs11cjO1OFUBaAK7yigSIei+sDfg14biXLtVxX0KRv
 Nbyyqyhmw+A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190219_114145_817045_C4EE2086 
X-CRM114-Status: UNSURE (   8.48  )
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
Cc: linux-amlogic@lists.infradead.org, netdev@vger.kernel.org,
 alexandre.torgue@st.com, Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Gpeppe.cavallaro@st.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Am 19.02.2019 um 09:47 schrieb Jose Abreu:
> Hi Simon,
>
> On 2/18/2019 6:05 PM, Simon Huelck wrote:
>> disabling EEE doesnt help ( did it via the entry in the .dtb / .dts ),
>> the results are the same. I can confirm the LPI counters are zero or one
>> only after the test.....
> It's interesting to see that you have a lot of RX packets but few
> RX interrupts. This can either be due to mis-configuration of
> interrupt flags or RX Watchdog.
>
> 1. For interrupt flags you should be using LEVEL triggered IRQ.
> 2. For RX Watchdog you can try disabling it by adding the
> following in your platform wrapper driver (which will be
> "dwmac-meson8b.c", at probe):
> 	"plat_data->force_sf_dma_mode = 1;" and
> 	"plat_data->riwt_off = 1;"
>
> Thanks,
> Jose Miguel Abreu

Hi,


are you aware that odroid c2 dts is using level irq ?

at which numbers do you estimage that RX irqs are low in numbers ?


regards,

Simon


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
