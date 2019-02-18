Return-Path: <SRS0=i5j0=QZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641BCC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 15:30:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34E65217D7
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 15:30:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZuMUG9xT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34E65217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utBLDRS3u6Xs2zwq4sjFJfIAoGuceWhBYx0JvsZ7hxk=; b=ZuMUG9xTEjwsvK
	X1sE7fNWR8wAAnk8V2tG10EP/pHgDnT2EIf7P629C8ak0EA+Udg/4ZodiM456cJHntUpI/9ECgO+D
	mV973sMmrEnoI6R7tLyMOEXbIy1c3IunHpdFMoNP7t+7VQTRJ82D0kHOHRx0tane1kflCGVR4yavv
	3bM4e8hfTQTil+pN7K8rE58Imx/sHUf3kDP0lH03ruRw5lBVBdcOXn2cVb5uIvyn8N5CpXXJbwehh
	ATUKGDIpC8D/f2hUiz1I0/tvw746iNCxmv/eEIGlDlUOElyOsLUSOpjykKezaa1f31loGWCie0Ryh
	G9gUTWWFtekSqY6lIY8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvkrj-0006qc-6l; Mon, 18 Feb 2019 15:29:55 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvkrf-0006eM-Ct
 for linux-amlogic@lists.infradead.org; Mon, 18 Feb 2019 15:29:53 +0000
Received: from [10.10.11.100] ([95.88.178.171]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LwGDy-1h78Pd3atq-0182Uz; Mon, 18
 Feb 2019 16:29:23 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Jose Abreu <jose.abreu@synopsys.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCDebPOsmrhSXecx48nGWHh7g_OGPbr1Y0M+n_v9Ht91ew@mail.gmail.com>
 <e05b7448-cd95-cdeb-c88d-3a324d5f1ddc@gmx.de>
 <CAFBinCAkXN42piiYsc_Qmuqv0w4dbK86gq10AbZyrB-zKuh9hg@mail.gmail.com>
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
Message-ID: <cd344fa3-758f-3824-ddd3-568ce837c4f7@gmx.de>
Date: Mon, 18 Feb 2019 16:29:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <84fb981c-75ab-ef9e-edd6-cd0c52d9dc36@synopsys.com>
X-Provags-ID: V03:K1:itPyKkIrMU/LHdPLAjLcYC00tfI4WEhIT7p/uKEzYRrX+H3i3wF
 cLkVIA8//iVrBNdY9TEKm0aOqNwHEzrLNMVPBFzHTNdoeWN+t1REAAXIKTS4IcIRUR1blaN
 xoM8cS0dwVEC6WPmTm//0R5BXBPtPm4gjvaK8mPifKLB+8ERmO84PcBxBK58i1tbVR+WYuK
 lK7BnhB1DBfSjfjW1KM7w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ijVjxGyFTY0=:MGQ1VZN0ArfqfUlSnri2r5
 Z6UEAJxiEnyZQes7hS6pq77lZAjacy/ewMC5DYIw3mCW5kbxp383wQ66A7+LGBGX6J7mYFebs
 DtkPNcjpQIm5/wC6KaphCPZSbo7++6Sx2i9UbPJF608wyoAAuZ2OQ79rqjLJp42FsXCatSQwX
 U/GhmyiIvX08Y7+pWBbb0haWoWbO+h9c57YnwQ8wq9X3myZfXateHlc3J9WSQ3nLFEMjB/1Fz
 fOl4a4+SOOirjVuv0X/w9lzt86Kbcq1UIEFUBgYviq+r4yEjk1aM39huRRKsX44QwxklUJTs7
 Sq2Zf4hquy7Sa57m3Ae670WFFiJtftZ8FnOMpB7NZZ0DqvmLjn/cAW2/RXBeNVH201uDsF1oD
 TF0wg10yZNHvC0BXEhlvJH/hNB1jCy/pMjRCMxZ4fTvyrbxwvtVdTc+N8adRwRjU+8l7HTpoI
 Njd8zClvc4DrXmJngfExfvMaEnbsu4+mUlKvgOBpruRwoBz/QBYaUIx32qYN0cwYg5NohTNbY
 5LsQn7KGE2Uwc0H8np03hDroD8/vF+b+mWrx8DhJbNQ03coQRys5CPjUqMtGZko30zSz8d2my
 pUTCQ+f61dviAs5O50WoZJ3JuN0QIULF+uVRH6sX9Bll04hGBnYeyn6Gu5/O7a1tfrQjtI3Ae
 spZoOxDiTNP6ALLJzlhphLqjm77QD/kiTdOvr90i9PXu/Ceia4aVnndJRBgy5/HbjBGapvqmb
 wBP4FvgaWFum/xQ2fkQs/Yi2ebHX/QvJiSRRxpjliTQLl/lKTl9MxIvRNVfHWIvkHB3zWglW9
 GDBymSsNbW3HwgrV8T3Ehw22SKzI7SNZRlIkYKQQif1XPs9Lo8ERyoLEQUbLw2ZTuoY+m2Vx5
 GQLmHRLLoUqw/jPeSrXRqTuvmEdn024mZR6oJ8EzCRcx7wjtwhM8S+xSxUrIJzL4/SObXVWdo
 OukrYWblvMQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_072951_738118_E895092C 
X-CRM114-Status: UNSURE (   7.07  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgppIHRyaWVkIHlvdXIgY29tbWFuZCBhbmQgdGVzdGVkIGFmdGVyd2FyZHMsIG5vIGNoYW5n
ZSBpbiBiZWhhdmlvdXIgLgoKQ2FuIGkgcmVzZXQgdGhlIGV0aHRvb2wgc3RhdGlzdGljcyBmb3Ig
YmV0dGVyIG92ZXJ2aWV3ID8KCgpyZWdhcmRzLApTaW1vbgoKCkFtIDE4LjAyLjIwMTkgdW0gMTQ6
MDIgc2NocmllYiBKb3NlIEFicmV1Ogo+IE9uIDIvMTgvMjAxOSAxMjo0MSBQTSwgSm9zZSBBYnJl
dSB3cm90ZToKPj4gT24gMi8xOC8yMDE5IDEyOjMzIFBNLCBTaW1vbiBIdWVsY2sgd3JvdGU6Cj4+
PiBIaSwKPj4+Cj4+Pgo+Pj4gaSByZWNvZ25pemUgdGhlIGZvbGxvd2luIG9uIG15IGV0aGVybmV0
IHN0YXRzOgo+Pj4KPj4+IMKgwqDCoMKgIHRocmVzaG9sZDogMQo+Pj4gwqDCoMKgwqAgdHhfcGt0
X246IDE0NTczMjUKPj4+IMKgwqDCoMKgIHJ4X3BrdF9uOiA1MDIyNDA1Cj4+PiDCoMKgwqDCoCBu
b3JtYWxfaXJxX246IDY3MTczOAo+Pj4gwqDCoMKgwqAgcnhfbm9ybWFsX2lycV9uOiA2MDY1NzMK
Pj4+IMKgwqDCoMKgIG5hcGlfcG9sbDogNzg0NDM5Cj4+PiDCoMKgwqDCoCB0eF9ub3JtYWxfaXJx
X246IDYxMDYxCj4+PiDCoMKgwqDCoCB0eF9jbGVhbjogNzg0NDM5Cj4+PiDCoMKgwqDCoCB0eF9z
ZXRfaWNfYml0OiA1ODI5Mwo+Pj4gwqDCoMKgwqAgaXJxX3JlY2VpdmVfcG10X2lycV9uOiAwCj4+
PiDCoMKgwqDCoCBtbWNfdHhfaXJxX246IDAKPj4+IMKgwqDCoMKgIG1tY19yeF9pcnFfbjogMAo+
Pj4gwqDCoMKgwqAgbW1jX3J4X2NzdW1fb2ZmbG9hZF9pcnFfbjogMAo+Pj4gLT4gwqAgwqDCoCBp
cnFfdHhfcGF0aF9pbl9scGlfbW9kZV9uOiAzODIwMzcKPj4+IC0+wqAgwqDCoMKgIGlycV90eF9w
YXRoX2V4aXRfbHBpX21vZGVfbjogMzgyMDIxCj4+Pgo+Pj4KPj4+IElzIHRoaXMgbm9ybWFsID8K
Pj4gRGlkIHlvdSB0cnkgZGlzYWJsaW5nIEVFRSA/ICgiZXRodG9vbCAtLXNldC1lZWUgZXRoMCBl
ZWUgb2ZmIikKPiBCVFcsIGRvIG5vdCB0cnkgdG8gcmUtZW5hYmxlIGl0LiBUaGVyZSBpcyBhIHJh
Y2UgaW4gdGhlIGVuYWJsZQo+IGZ1bmN0aW9uLiBJIHdpbGwgc2VuZCBhIGZpeCBBU0FQLgo+Cj4+
IFRoYW5rcywKPj4gSm9zZSBNaWd1ZWwgQWJyZXUKPj4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
