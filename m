Return-Path: <SRS0=eh9O=TW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CE9C282CE
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 May 2019 12:50:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45F8E21479
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 May 2019 12:50:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HUIq9nkn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="jMlxg8/E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45F8E21479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvmQZJAMy9BXOLQfD+bgaWDCFR0tL8oD29eLFBkINCQ=; b=HUIq9nknqCEXGc
	0u/X8dN18bFpJcxFhamoCOxcWpuD7J0E6TxsHap/m+UsMCKUtN68qNTcMLB2+6Pc9enqNP21nG9rX
	22obJOGtQMezTAp098DlBJQ5TWKR/uu0xGDrm+GrIVD9/T8GIzdYR6UeTlK2pfsb9GDsRcQNSXe3t
	/VsWEqAE6YANoag4NuKRUxlYycwNcRM0shEd3k8cTFZeLcC7le/huRTuceBdemiwklsjBsV78oQyz
	2UiJmyYLUGqwWOjd+Uwi468W0mPMpU3kRwp9JZ5SFDh2z4IoDKATBAO1ek5oNyRS4zOkBZqDoWHNd
	2x6g4A7VwOWjIcXtxlHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTQgq-0001Sd-Sd; Wed, 22 May 2019 12:49:52 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTQgo-0001SH-5h
 for linux-amlogic@lists.infradead.org; Wed, 22 May 2019 12:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1558529376;
 bh=Q97bXc/PPktmqP9qjjGjOSaN7RwZuTwBfD1GaTGlWT8=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=jMlxg8/EHFenJktXveeQ7h682zslXJJpcwLmk0IJTiS6bn+3vznj+AzYJ07DP6xZC
 iuLUc85WS8skPMBZZiEgpy8yR9Nu6jW6+dzOmNIFdj0eywFZ6bxkLgkePikYA8X4Vc
 uWXqGU6/9qevTsK/hLjsNCKtchk3Cy7SlwmV0ER4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.10.11.100] ([95.88.214.118]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MF5FT-1hRZ8m49Pf-00GHMz; Wed, 22
 May 2019 14:49:36 +0200
Subject: Re: stmmac / meson8b-dwmac
To: Jose Abreu <Jose.Abreu@synopsys.com>,
 Sebastian Gottschall <s.gottschall@newmedia-net.de>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <45e73e8c-a0fb-6f8f-8dc6-3aa2103fdda3@gmx.de>
 <e1d75e7f-1747-d0ce-0ee7-4fa688b90d13@synopsys.com>
 <4493b245-de93-46cd-327b-8091a3babc3a@gmx.de>
 <adafe6d7-e619-45e9-7ecb-76f003b0c7d9@synopsys.com>
 <cd0b3dec-af3f-af69-50b7-6ca6f7256900@gmx.de>
 <fa35fb4a-b9d5-9bbb-437d-47e8819d0f27@synopsys.com>
 <244d7c74-e0ca-a9c7-f4b0-3de7bec4024b@gmx.de>
 <1426d8ed40be0927c135aff25dcf989a11326932.camel@baylibre.com>
 <9074d29b-4cc9-87b6-009f-48280a4692c0@gmx.de>
 <d7de65c614ee788152300f6d3799fd537b438496.camel@baylibre.com>
 <8ec64936-c8fa-1f0e-68bf-2ad1d6e8f5d9@gmx.de>
 <f08f2659-dde0-41ec-9233-6b4d5f375ffe@newmedia-net.de>
 <3a040370-e7e5-990e-81dc-8e9bb0ab7761@gmx.de>
 <c21c30e9-e53e-02a5-c367-25898c4614e9@synopsys.com>
 <12d1d6de-2905-46a8-6481-d6f20c8e9d85@gmx.de>
 <2c4d9726-6c2a-cd95-0493-323f5f09e14a@synopsys.com>
 <2d7a5c80-3134-ebc0-3c44-9ca9900eade8@gmx.de>
 <78EB27739596EE489E55E81C33FEC33A0B91BAAE@DE02WEMBXB.internal.synopsys.com>
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
Message-ID: <4f204468-67f4-6d88-ea02-c48f869d8ae3@gmx.de>
Date: Wed, 22 May 2019 14:48:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <78EB27739596EE489E55E81C33FEC33A0B91BAAE@DE02WEMBXB.internal.synopsys.com>
X-Provags-ID: V03:K1:ShOus8Fo/Ar2hBlTIZy9YCIsXOftcGWHyXjUmtHlhlXVE0DBcFx
 ANpfUj7K0TdRfoyDKUYtnfEzzUSKgOcEXcPfXcL0XVQxs2qSDnUYUclVj4Dkie9zH5enO+B
 Bde3hWcKbpaOVbJxiWXrOpvVY2NobKj3od6iCuetnSKqIqNJePwuNcW4K575eygohoPF4G2
 RC4sew3XIxVoc3953e6/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HjuxOAuueoU=:vBu8B3L3BhhBaJwR09OZeR
 iZPGfWDYTxU/J9DMmvjLoQ3lAak+rZfa346rt9Xk4EQ5l8BO64fXZtRhxvXhaGDxSmPQU8FCr
 XcUdAYI94DzCTU0IlSsE3imYdZsnHR25wSBTOKcJZtTUNqgLCgtZ2pXKJ0K8WjvZbB8mmVhBO
 jiC0hxZE32SZvmwA9PokMvArPAao9YcJ5oTklrhuW8PgM0fQGV1p9kTlHbN2ngN60qMIvqgxi
 iYp3VnJ7IK1fx7uljagEYFpxzdiPc9ngZe4MM3RewTfjQQwwurNg0OA8DUrAFg4bLWp+x9Fvc
 QfbIqvcabw/L9R3kQfCY6idt89TB/lcuDPfeQTjGzCdOb0q/pPcvLxJfUOkiBXrjGPVycunEU
 KRXa7kvHcN7TaWUB8Wdn/JEPFmj5VuFCxG0mtoiL1BG4x9+K9EecGgjp1I+VgXIMNk9JE/Jjh
 BRNEntS4OrMifM1irdh6RjtaBcU2h3B2/ZE4CyS6Zz0XzvztmYGG3qsRkw+gopKBfLcyPrEjb
 6pC1O/OyvkhmAHrhJlWlKnjCqi348qrOkkyUd/ZOeLc5R8gTMnFHGIGTeuxutqn1lVYLoFWHV
 fWk9fYCb1yNRMFD1uyYp58oGcCwgyPDf5829pTHEB5UYFpsREj9pfUWC3ITzg/tn03Q6mWur7
 2r0ivJNCpZujnW70MdQNVfUPEiwazcWQTKZjW6bZvVgv1QID7W9ObztcXpyZb3Uw0ujbuxglZ
 Dpnc5hwNsLJBiDly8VwCO7XuSdV1TmSsIwrOA0SbhY+FT/aFnIn4ziHEhzGTzHc31QWplic/6
 zAe1qcsoWmbSdFp3MBsUSmS1YKUJYg4PeffujgIK0V8JKc/G6eFyrZrEZqvnFib8xlezAXfHI
 aM+ptL7kNgbf2IGHgdflCzhOZ1EMHADIYWnZr/5EnHMvUZCiLIJ/09FKVrSwgdt+B46bKrJd8
 CISMv/hemJ3/qcAPSH5TG7GuzhatHtSxJxW4IB8UUBGWOa7o9rTzX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_054950_556023_1AF560D9 
X-CRM114-Status: UNSURE (   5.54  )
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
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 "Gpeppe.cavallaro@st.com" <Gpeppe.cavallaro@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

what exactly do you mean with this DT binding ? i cant find this for
meson gxbb somewhere in the DTS ?

regards,

Simon


Am 13.05.2019 um 11:07 schrieb Jose Abreu:
> From: Simon Huelck <simonmail@gmx.de>
> Date: Sat, May 11, 2019 at 15:53:34
>
>> ethtool -S gave me some counts for mmc_rx_fifo_overflow, which i didnt
>> recognize before.
> Flow Control can prevent this to happen. Please check if your DT FIFO
> bindings are >= 4096.
>
>> Do we have new ideas / new direction to dig for ?
> GIT Bisect is the best direction to follow.
>
> Thanks,
> Jose Miguel Abreu



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
