Return-Path: <SRS0=i5j0=QZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5E1C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 18:06:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC80221736
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 18:06:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M9GpCOaY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC80221736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wVQdVU91Vt3nIW0FKiMNGRi29eQA89V4PsRPaWEAQY4=; b=M9GpCOaYbaUvG+Sbyjmsv/+dH
	g5pMvydpYWP/YMC5PVAnTcQxjwabQj6yhABMZKewwhWSTkmZsfDR/Tbc7BKCUG+ESc7Rm+YT7ARUT
	kbjdve4WgoSvPbvaqI60kW9lKFiCjka88X0KEyx+WFYHVFPiUCLBHW0yN86WZ23gIF6BW70KQJ4UN
	VSP+wIeCFZBkmdny1B9RxSItiti2gFs4ohd7B4ZvYe/E43I0UXgidjSqfYDhYieDVPkBmCrU7iy2E
	TVTs72DReYC3y6QbGWUqpHPrW6lJB07CycvDf/UpT6Loe/VCKLS8ZoLL3x9iXDE3znYqbDFrr/9aq
	5FXRp2WCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvnIt-0004z1-TC; Mon, 18 Feb 2019 18:06:07 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvnIp-0004yc-Cr
 for linux-amlogic@lists.infradead.org; Mon, 18 Feb 2019 18:06:05 +0000
Received: from [10.10.11.100] ([95.88.178.171]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MXI5V-1gb3LE2LsT-00WHi1; Mon, 18
 Feb 2019 19:05:49 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Jose Abreu <jose.abreu@synopsys.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <20190206103645.GA2482@ingrassia.epigenesys.com>
 <3001f244-8904-1e89-9595-62a65a7b32ae@gmx.de>
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
Message-ID: <cd0b3dec-af3f-af69-50b7-6ca6f7256900@gmx.de>
Date: Mon, 18 Feb 2019 19:05:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <adafe6d7-e619-45e9-7ecb-76f003b0c7d9@synopsys.com>
Content-Type: multipart/mixed; boundary="------------638E54F1BF61DD1DDC9C1A6C"
X-Provags-ID: V03:K1:J6hEmBSBvQTHn8d1/4ewJyh5X/iBUJr+bYRM6nrqtXjKsh9QZ5k
 aXEz1yMEDAxhUDteuqk0FIIO5SNVeNl5e9KAV5qbXvJKTaPhg7ahvQ295SQDf4s3Pe9e4Tn
 urefp8DBu9t1u5k4CQGqAcxi5hYHAMDmd3EheesqP7tynd8NTxERbLh1JDNLJRts0svJAVp
 qigevKkL07mYxLIa02esw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3yRPFY2Td4A=:tyNL2kjdFGZEHVIVXj05u1
 Kl0pAliIKydmv1cX2tuN91g0nJzVv3wDMpEKHIZjlu9zjYrFF2lbwCkr6zT5Q86d3EUg9asJZ
 SDuDB5X5yR37lWi/WKE7sZCmfCQpBt8AOqKLTRYZpUv0KUALBQXfoxY97pBGOjQ15yTfizsBl
 EOCsax44GwsIjF5nDVFYqFwQLmAvrJAgcxTLKIQc8dXLKUtU/SJ/Ze4hCv4ItjFYGCoEpcjii
 KyjYy5zgU5obZKBKay0gUspAgj1jFPgs9F+Lqdz6J3Lf1RwDbNpxOQxzyu59wGD/cOsZ2KabA
 CJDHBRGgg3LFKmMGeCVWaMCzInXGA5BYDebdpjztSfNAt18zoWA76v1BpgRKkAz32eAfutSKJ
 8+PKMZmtS3ZXI8UtNn1uMUc6pF8XH9T+HwKdKTtYzCdH7M0f+MZjHVYnDlYYEYuWUsnQTTuuq
 QWkMAJW5ULcDlQkhlcL4k3vMxOueHfTkPmCl23pfVFBNemzC3Oq33AIpp/plvYrCjhywpa54m
 nA8NQSjcKAwsgPSx0w4Vu7eRQAMfzjMXRUpqczGQNyMoLzl9MLjcVzrV9WYq4wioPZJ5NlyGv
 bNKlAtBGwrhuNP4BO3sDkKBvMKdQhBHPPgy3ltxNrjZfr0jeyQGBTqngAqc9XXftTK3tOSqh6
 TRu2uCrF5wn3cKwlmz2ZuUN6YJyM0DkyjJwkBd5jLBQpMYZ43dSb2JUgcFfYRgmLZ3X0rHbqj
 eC2O2QrU53QTW1aQFCPVlqlR1wh1PggESQ8IhjBM9ilosHO/O92GtBeE83svSxzEmPES3nJGD
 moPXp33bmtQ7Oj+/rnmuPsPGYnDXn92Gvn07dW94Zn+n1VkysrItNeYCvc+Ww1qdJGZ38in8V
 LOFFIgK9VwRzSDTUG4H9WF7ahVNIe+sGqXb20oz4lIFVxr2t0P3rBszBAYsJHv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_100603_743069_470241FA 
X-CRM114-Status: UNSURE (   8.36  )
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
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.
--------------638E54F1BF61DD1DDC9C1A6C
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Am 18.02.2019 um 18:05 schrieb Jose Abreu:
> On 2/18/2019 4:51 PM, Simon Huelck wrote:
>> Hi,
>>
>> no im testing vanilla mainline kernel and against 4.14. where
>> performance was ok. but turning off EEE via ethtool should have same
>> results than removal of that patch.
>>
>> But, since it was mainlined recently , not long ago, i think this was
>> tested ??
> The thing is that phy_init_eee() is called by stmmac and this
> function does not take into account the broken modes if it's
> called too early which will cause driver to enable LPI in MAC.
>
> And anyway, if you have lpi values in the ethtool stats then EEE
> is being enabled by stmmac.
>
> Please try the change I suggested.
>
> Thanks,
> Jose Miguel Abreu

Hi,



disabling EEE doesnt help ( did it via the entry in the .dtb / .dts ),
the results are the same. I can confirm the LPI counters are zero or one
only after the test.....

C:\Users\Simon\Downloads\iperf-2.0.9-win64>iperf -c 10.10.11.1 -i1  -d
------------------------------------------------------------
Server listening on TCP port 5001
TCP window size:  208 KByte (default)
------------------------------------------------------------
------------------------------------------------------------
Client connecting to 10.10.11.1, TCP port 5001
TCP window size:  208 KByte (default)
------------------------------------------------------------
[  4] local 10.10.11.100 port 56114 connected with 10.10.11.1 port 5001
[  5] local 10.10.11.100 port 5001 connected with 10.10.11.1 port 47866
[ ID] Interval       Transfer     Bandwidth
[  4]  0.0- 1.0 sec  20.1 MBytes   169 Mbits/sec
[  5]  0.0- 1.0 sec  75.8 MBytes   635 Mbits/sec
[  4]  1.0- 2.0 sec  18.1 MBytes   152 Mbits/sec
[  5]  1.0- 2.0 sec  69.0 MBytes   579 Mbits/sec
[  4]  2.0- 3.0 sec  15.6 MBytes   131 Mbits/sec
[  5]  2.0- 3.0 sec  70.7 MBytes   593 Mbits/sec
[  4]  3.0- 4.0 sec  15.9 MBytes   133 Mbits/sec
[  5]  3.0- 4.0 sec  70.3 MBytes   590 Mbits/sec
[  4]  4.0- 5.0 sec  16.4 MBytes   137 Mbits/sec
[  5]  4.0- 5.0 sec  69.5 MBytes   583 Mbits/sec
[  4]  5.0- 6.0 sec  16.5 MBytes   138 Mbits/sec
[  5]  5.0- 6.0 sec  69.0 MBytes   579 Mbits/sec
[  4]  6.0- 7.0 sec  18.2 MBytes   153 Mbits/sec
[  5]  6.0- 7.0 sec  69.8 MBytes   585 Mbits/sec
[  4]  7.0- 8.0 sec  15.6 MBytes   131 Mbits/sec
[  5]  7.0- 8.0 sec  70.0 MBytes   587 Mbits/sec
[  4]  8.0- 9.0 sec  16.2 MBytes   136 Mbits/sec
[  5]  8.0- 9.0 sec  69.6 MBytes   583 Mbits/sec
[  4]  9.0-10.0 sec  17.1 MBytes   144 Mbits/sec
[  4]  0.0-10.0 sec   170 MBytes   142 Mbits/sec
[  5]  9.0-10.0 sec  69.1 MBytes   580 Mbits/sec
[  5]  0.0-10.0 sec   703 MBytes   589 Mbits/sec



regards,

Simon


--------------638E54F1BF61DD1DDC9C1A6C
Content-Type: text/plain; charset=UTF-8;
 name="ethtool_test2.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="ethtool_test2.txt"

TklDIHN0YXRpc3RpY3M6CiAgICAgbW1jX3R4X29jdGV0Y291bnRfZ2I6IDAKICAgICBtbWNf
dHhfZnJhbWVjb3VudF9nYjogMAogICAgIG1tY190eF9icm9hZGNhc3RmcmFtZV9nOiAwCiAg
ICAgbW1jX3R4X211bHRpY2FzdGZyYW1lX2c6IDAKICAgICBtbWNfdHhfNjRfb2N0ZXRzX2di
OiAwCiAgICAgbW1jX3R4XzY1X3RvXzEyN19vY3RldHNfZ2I6IDAKICAgICBtbWNfdHhfMTI4
X3RvXzI1NV9vY3RldHNfZ2I6IDAKICAgICBtbWNfdHhfMjU2X3RvXzUxMV9vY3RldHNfZ2I6
IDAKICAgICBtbWNfdHhfNTEyX3RvXzEwMjNfb2N0ZXRzX2diOiAwCiAgICAgbW1jX3R4XzEw
MjRfdG9fbWF4X29jdGV0c19nYjogMAogICAgIG1tY190eF91bmljYXN0X2diOiAwCiAgICAg
bW1jX3R4X211bHRpY2FzdF9nYjogMAogICAgIG1tY190eF9icm9hZGNhc3RfZ2I6IDAKICAg
ICBtbWNfdHhfdW5kZXJmbG93X2Vycm9yOiAwCiAgICAgbW1jX3R4X3NpbmdsZWNvbF9nOiAw
CiAgICAgbW1jX3R4X211bHRpY29sX2c6IDAKICAgICBtbWNfdHhfZGVmZXJyZWQ6IDAKICAg
ICBtbWNfdHhfbGF0ZWNvbDogMAogICAgIG1tY190eF9leGVzc2NvbDogMAogICAgIG1tY190
eF9jYXJyaWVyX2Vycm9yOiAwCiAgICAgbW1jX3R4X29jdGV0Y291bnRfZzogMAogICAgIG1t
Y190eF9mcmFtZWNvdW50X2c6IDAKICAgICBtbWNfdHhfZXhjZXNzZGVmOiAwCiAgICAgbW1j
X3R4X3BhdXNlX2ZyYW1lOiAwCiAgICAgbW1jX3R4X3ZsYW5fZnJhbWVfZzogMAogICAgIG1t
Y19yeF9mcmFtZWNvdW50X2diOiAyMzQ4NjUzCiAgICAgbW1jX3J4X29jdGV0Y291bnRfZ2I6
IDMyOTkxOTA0MTQKICAgICBtbWNfcnhfb2N0ZXRjb3VudF9nOiAzMjk5MTkwNDEzCiAgICAg
bW1jX3J4X2Jyb2FkY2FzdGZyYW1lX2c6IDkyODE2CiAgICAgbW1jX3J4X211bHRpY2FzdGZy
YW1lX2c6IDI0OQogICAgIG1tY19yeF9jcmNfZXJyb3I6IDIKICAgICBtbWNfcnhfYWxpZ25f
ZXJyb3I6IDAKICAgICBtbWNfcnhfcnVuX2Vycm9yOiAyCiAgICAgbW1jX3J4X2phYmJlcl9l
cnJvcjogMAogICAgIG1tY19yeF91bmRlcnNpemVfZzogMAogICAgIG1tY19yeF9vdmVyc2l6
ZV9nOiAwCiAgICAgbW1jX3J4XzY0X29jdGV0c19nYjogMAogICAgIG1tY19yeF82NV90b18x
Mjdfb2N0ZXRzX2diOiAxNzI4MDkKICAgICBtbWNfcnhfMTI4X3RvXzI1NV9vY3RldHNfZ2I6
IDE1OTAyCiAgICAgbW1jX3J4XzI1Nl90b181MTFfb2N0ZXRzX2diOiA2NTkKICAgICBtbWNf
cnhfNTEyX3RvXzEwMjNfb2N0ZXRzX2diOiAzNzAKICAgICBtbWNfcnhfMTAyNF90b19tYXhf
b2N0ZXRzX2diOiAyMTU4OTExCiAgICAgbW1jX3J4X3VuaWNhc3RfZzogMjI1NTU4NgogICAg
IG1tY19yeF9sZW5ndGhfZXJyb3I6IDIKICAgICBtbWNfcnhfYXV0b2ZyYW5nZXR5cGU6IDAK
ICAgICBtbWNfcnhfcGF1c2VfZnJhbWVzOiAwCiAgICAgbW1jX3J4X2ZpZm9fb3ZlcmZsb3c6
IDI5MjQKICAgICBtbWNfcnhfdmxhbl9mcmFtZXNfZ2I6IDIzNDg1OTEKICAgICBtbWNfcnhf
d2F0Y2hkb2dfZXJyb3I6IDAKICAgICBtbWNfcnhfaXBjX2ludHJfbWFzazogNDI5NDM3NzQ2
MAogICAgIG1tY19yeF9pcGNfaW50cjogMAogICAgIG1tY19yeF9pcHY0X2dkOiAyMjU1OTI5
CiAgICAgbW1jX3J4X2lwdjRfaGRlcnI6IDAKICAgICBtbWNfcnhfaXB2NF9ub3BheTogMjEK
ICAgICBtbWNfcnhfaXB2NF9mcmFnOiAwCiAgICAgbW1jX3J4X2lwdjRfdWRzYmw6IDEKICAg
ICBtbWNfcnhfaXB2NF9nZF9vY3RldHM6IDMyNDI3Njg1NDEKICAgICBtbWNfcnhfaXB2NF9o
ZGVycl9vY3RldHM6IDAKICAgICBtbWNfcnhfaXB2NF9ub3BheV9vY3RldHM6IDk4MgogICAg
IG1tY19yeF9pcHY0X2ZyYWdfb2N0ZXRzOiAwCiAgICAgbW1jX3J4X2lwdjRfdWRzYmxfb2N0
ZXRzOiAxMgogICAgIG1tY19yeF9pcHY2X2dkX29jdGV0czogMjA4NTEKICAgICBtbWNfcnhf
aXB2Nl9oZGVycl9vY3RldHM6IDAKICAgICBtbWNfcnhfaXB2Nl9ub3BheV9vY3RldHM6IDAK
ICAgICBtbWNfcnhfaXB2Nl9nZDogOTMKICAgICBtbWNfcnhfaXB2Nl9oZGVycjogMAogICAg
IG1tY19yeF9pcHY2X25vcGF5OiAwCiAgICAgbW1jX3J4X3VkcF9nZDogMTk0MgogICAgIG1t
Y19yeF91ZHBfZXJyOiAwCiAgICAgbW1jX3J4X3RjcF9nZDogMjI1NDA0NQogICAgIG1tY19y
eF90Y3BfZXJyOiAwCiAgICAgbW1jX3J4X2ljbXBfZ2Q6IDM0CiAgICAgbW1jX3J4X2ljbXBf
ZXJyOiAwCiAgICAgbW1jX3J4X3VkcF9nZF9vY3RldHM6IDg4NTM1NQogICAgIG1tY19yeF91
ZHBfZXJyX29jdGV0czogMAogICAgIG1tY19yeF90Y3BfZ2Rfb2N0ZXRzOiAzMTk2NzgwMjU5
CiAgICAgbW1jX3J4X3RjcF9lcnJfb2N0ZXRzOiAwCiAgICAgbW1jX3J4X2ljbXBfZ2Rfb2N0
ZXRzOiAxMzAwCiAgICAgbW1jX3J4X2ljbXBfZXJyX29jdGV0czogMAogICAgIHR4X3VuZGVy
ZmxvdzogMAogICAgIHR4X2NhcnJpZXI6IDAKICAgICB0eF9sb3NzY2FycmllcjogMAogICAg
IHZsYW5fdGFnOiAyMzQ1NjY3CiAgICAgdHhfZGVmZXJyZWQ6IDAKICAgICB0eF92bGFuOiA2
NTU5ODIKICAgICB0eF9qYWJiZXI6IDAKICAgICB0eF9mcmFtZV9mbHVzaGVkOiAwCiAgICAg
dHhfcGF5bG9hZF9lcnJvcjogMAogICAgIHR4X2lwX2hlYWRlcl9lcnJvcjogMAogICAgIHJ4
X2Rlc2M6IDAKICAgICBzYV9maWx0ZXJfZmFpbDogMAogICAgIG92ZXJmbG93X2Vycm9yOiAw
CiAgICAgaXBjX2NzdW1fZXJyb3I6IDAKICAgICByeF9jb2xsaXNpb246IDAKICAgICByeF9j
cmNfZXJyb3JzOiAwCiAgICAgZHJpYmJsaW5nX2JpdDogMAogICAgIHJ4X2xlbmd0aDogMAog
ICAgIHJ4X21paTogMAogICAgIHJ4X211bHRpY2FzdDogMAogICAgIHJ4X2dtYWNfb3ZlcmZs
b3c6IDAKICAgICByeF93YXRjaGRvZzogMAogICAgIGRhX3J4X2ZpbHRlcl9mYWlsOiAwCiAg
ICAgc2FfcnhfZmlsdGVyX2ZhaWw6IDAKICAgICByeF9taXNzZWRfY250cjogMAogICAgIHJ4
X292ZXJmbG93X2NudHI6IDAKICAgICByeF92bGFuOiAwCiAgICAgdHhfdW5kZWZsb3dfaXJx
OiAwCiAgICAgdHhfcHJvY2Vzc19zdG9wcGVkX2lycTogMAogICAgIHR4X2phYmJlcl9pcnE6
IDAKICAgICByeF9vdmVyZmxvd19pcnE6IDAKICAgICByeF9idWZfdW5hdl9pcnE6IDAKICAg
ICByeF9wcm9jZXNzX3N0b3BwZWRfaXJxOiAwCiAgICAgcnhfd2F0Y2hkb2dfaXJxOiAwCiAg
ICAgdHhfZWFybHlfaXJxOiAwCiAgICAgZmF0YWxfYnVzX2Vycm9yX2lycTogMAogICAgIHJ4
X2Vhcmx5X2lycTogMjA1MjEKICAgICB0aHJlc2hvbGQ6IDEKICAgICB0eF9wa3RfbjogNjU1
OTgyCiAgICAgcnhfcGt0X246IDIzNDU3MjcKICAgICBub3JtYWxfaXJxX246IDIyNzQ2Ngog
ICAgIHJ4X25vcm1hbF9pcnFfbjogMTk1NDkzCiAgICAgbmFwaV9wb2xsOiAyMjc0MzgKICAg
ICB0eF9ub3JtYWxfaXJxX246IDI4OTcyCiAgICAgdHhfY2xlYW46IDIyNzQzOAogICAgIHR4
X3NldF9pY19iaXQ6IDI2MjM5CiAgICAgaXJxX3JlY2VpdmVfcG10X2lycV9uOiAwCiAgICAg
bW1jX3R4X2lycV9uOiAwCiAgICAgbW1jX3J4X2lycV9uOiAwCiAgICAgbW1jX3J4X2NzdW1f
b2ZmbG9hZF9pcnFfbjogMAogICAgIGlycV90eF9wYXRoX2luX2xwaV9tb2RlX246IDAKICAg
ICBpcnFfdHhfcGF0aF9leGl0X2xwaV9tb2RlX246IDAKICAgICBpcnFfcnhfcGF0aF9pbl9s
cGlfbW9kZV9uOiAxCiAgICAgaXJxX3J4X3BhdGhfZXhpdF9scGlfbW9kZV9uOiAxCiAgICAg
cGh5X2VlZV93YWtldXBfZXJyb3JfbjogMAogICAgIGlwX2hkcl9lcnI6IDAKICAgICBpcF9w
YXlsb2FkX2VycjogMAogICAgIGlwX2NzdW1fYnlwYXNzZWQ6IDAKICAgICBpcHY0X3BrdF9y
Y3ZkOiAwCiAgICAgaXB2Nl9wa3RfcmN2ZDogMAogICAgIG5vX3B0cF9yeF9tc2dfdHlwZV9l
eHQ6IDAKICAgICBwdHBfcnhfbXNnX3R5cGVfc3luYzogMAogICAgIHB0cF9yeF9tc2dfdHlw
ZV9mb2xsb3dfdXA6IDAKICAgICBwdHBfcnhfbXNnX3R5cGVfZGVsYXlfcmVxOiAwCiAgICAg
cHRwX3J4X21zZ190eXBlX2RlbGF5X3Jlc3A6IDAKICAgICBwdHBfcnhfbXNnX3R5cGVfcGRl
bGF5X3JlcTogMAogICAgIHB0cF9yeF9tc2dfdHlwZV9wZGVsYXlfcmVzcDogMAogICAgIHB0
cF9yeF9tc2dfdHlwZV9wZGVsYXlfZm9sbG93X3VwOiAwCiAgICAgcHRwX3J4X21zZ190eXBl
X2Fubm91bmNlOiAwCiAgICAgcHRwX3J4X21zZ190eXBlX21hbmFnZW1lbnQ6IDAKICAgICBw
dHBfcnhfbXNnX3BrdF9yZXNlcnZlZF90eXBlOiAwCiAgICAgcHRwX2ZyYW1lX3R5cGU6IDAK
ICAgICBwdHBfdmVyOiAwCiAgICAgdGltZXN0YW1wX2Ryb3BwZWQ6IDAKICAgICBhdl9wa3Rf
cmN2ZDogMAogICAgIGF2X3RhZ2dlZF9wa3RfcmN2ZDogMAogICAgIHZsYW5fdGFnX3ByaW9y
aXR5X3ZhbDogMAogICAgIGwzX2ZpbHRlcl9tYXRjaDogMAogICAgIGw0X2ZpbHRlcl9tYXRj
aDogMAogICAgIGwzX2w0X2ZpbHRlcl9ub19tYXRjaDogMAogICAgIGlycV9wY3NfYW5lX246
IDAKICAgICBpcnFfcGNzX2xpbmtfbjogMAogICAgIGlycV9yZ21paV9uOiAwCiAgICAgbXRs
X3R4X3N0YXR1c19maWZvX2Z1bGw6IDAKICAgICBtdGxfdHhfZmlmb19ub3RfZW1wdHk6IDAK
ICAgICBtbXRsX2ZpZm9fY3RybDogMAogICAgIG10bF90eF9maWZvX3JlYWRfY3RybF93cml0
ZTogMAogICAgIG10bF90eF9maWZvX3JlYWRfY3RybF93YWl0OiAwCiAgICAgbXRsX3R4X2Zp
Zm9fcmVhZF9jdHJsX3JlYWQ6IDAKICAgICBtdGxfdHhfZmlmb19yZWFkX2N0cmxfaWRsZTog
MAogICAgIG1hY190eF9pbl9wYXVzZTogMAogICAgIG1hY190eF9mcmFtZV9jdHJsX3hmZXI6
IDAKICAgICBtYWNfdHhfZnJhbWVfY3RybF9pZGxlOiAwCiAgICAgbWFjX3R4X2ZyYW1lX2N0
cmxfd2FpdDogMAogICAgIG1hY190eF9mcmFtZV9jdHJsX3BhdXNlOiAwCiAgICAgbWFjX2dt
aWlfdHhfcHJvdG9fZW5naW5lOiAwCiAgICAgbXRsX3J4X2ZpZm9fZmlsbF9sZXZlbF9mdWxs
OiAwCiAgICAgbXRsX3J4X2ZpZm9fZmlsbF9hYm92ZV90aHJlc2g6IDAKICAgICBtdGxfcnhf
Zmlmb19maWxsX2JlbG93X3RocmVzaDogMAogICAgIG10bF9yeF9maWZvX2ZpbGxfbGV2ZWxf
ZW1wdHk6IDAKICAgICBtdGxfcnhfZmlmb19yZWFkX2N0cmxfZmx1c2g6IDAKICAgICBtdGxf
cnhfZmlmb19yZWFkX2N0cmxfcmVhZF9kYXRhOiAwCiAgICAgbXRsX3J4X2ZpZm9fcmVhZF9j
dHJsX3N0YXR1czogMAogICAgIG10bF9yeF9maWZvX3JlYWRfY3RybF9pZGxlOiAwCiAgICAg
bXRsX3J4X2ZpZm9fY3RybF9hY3RpdmU6IDAKICAgICBtYWNfcnhfZnJhbWVfY3RybF9maWZv
OiAwCiAgICAgbWFjX2dtaWlfcnhfcHJvdG9fZW5naW5lOiAwCiAgICAgdHhfdHNvX2ZyYW1l
czogMAogICAgIHR4X3Rzb19uZnJhZ3M6IDAK
--------------638E54F1BF61DD1DDC9C1A6C
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--------------638E54F1BF61DD1DDC9C1A6C--

