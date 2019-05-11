Return-Path: <SRS0=6y+j=TL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0334C04AB1
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 14:54:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F9FB216C4
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 14:54:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l4xnYAD6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Fga3wEyY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F9FB216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBv3DrXpO1Kj7xIZ/z+cSbmO/pYw8HRE/miqPhTan9M=; b=l4xnYAD6ZCelF3
	J1Cg697e8entC3E0m1Yf4PQXCUUdf510niWOuFjpmHs86lcZVgJh57KUstBvX1DUeTHTUFISYBZUI
	4EmRFAl/mR7a+E4vdml8gn9Z7/iCCxJZz1eLSvCmJCn8whq4L8y+zbKl3tLvX2kvSnmfJEHtx5WLh
	7XVoOzLSeIIKVc116M+t0sucVyIV4Vm++qLn+mKeg7/PQe6bNmtmGcbPXv1SlA1ghTbwVOjNP32J1
	TfVqWWsZwAGI9CCccIYlMki8s1P0XcmTRoLUz/czOIDCKHKh9AhfJxZzuE8t5J57FVeTVSkBfW7Xp
	wDuSK/aUqeNW2rmgqgpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPTOc-0007Z2-3b; Sat, 11 May 2019 14:54:42 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPTOY-0007Yb-2V
 for linux-amlogic@lists.infradead.org; Sat, 11 May 2019 14:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1557586463;
 bh=Ad8Six8c/BQRteASr2Df0TRVC6SqiftX9K4CihvRBNE=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=Fga3wEyYWtMLKGs4d+ODg/Ogv0N7Q1EEFqD+PB5iSdR4mEUPcsEjZEuV9SsLIKDpg
 UOrGXXtrOEaN68NMYTArUj168Rji8H1FnnszGXQTz43VvLTG3VZZ10RSVYsYErW2c3
 W76K7AF2iqnirv8B8SGnKMEf2dlNXnD/SS2AHS98=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.10.11.100] ([95.88.214.118]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0Lzsf1-1gcZrw3AOJ-0151eA; Sat, 11
 May 2019 16:54:23 +0200
Subject: Re: stmmac / meson8b-dwmac
To: Jose Abreu <jose.abreu@synopsys.com>,
 Sebastian Gottschall <s.gottschall@newmedia-net.de>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <065407cd-c13b-e74c-7798-508650c12caf@gmx.de>
 <227be4e9-b0cc-a011-2558-71a17567246f@synopsys.com>
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
Message-ID: <2d7a5c80-3134-ebc0-3c44-9ca9900eade8@gmx.de>
Date: Sat, 11 May 2019 16:53:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2c4d9726-6c2a-cd95-0493-323f5f09e14a@synopsys.com>
X-Provags-ID: V03:K1:BlJSKsW3cKaWy5Sv0qlmZ9rruqoCZJYFmrYg/NdvuxJK3Xa6eHR
 +6ClsS/lXutPrE6tgjlfpapxhMt+XKYLAPG+HYRZImbFHO8bdJ9wAwWcJVEWxYgAmsUfxqp
 QCeSz5k1HZeljg/Jtq2x2PlfOYFpZL8NU88Cw2tRxsMmrk393tAiEdz5H1J0Op2c1AeEvrb
 om+azvUOM2ZAxEHNdSXdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1cRMGV0D1IY=:v/lJhRUCnNi12w9zv99DFL
 HOi2mqHdK1hpN2LMkCFkvvFozHxVvBXqHT+ApsblX+myuK5mAIdbZQvjzJrdEdhZEH/6KcZd+
 dCvZ8I8pksTmNxTYCqIuIdV794s1+yV7INv/sXyqMVKxHeLfj1UF7kqoZnxqOuQyIvH+vGaEX
 FxvBQ7u6gex6GOnbU6mnjwsg1sRpHalEyl4JcOsJVxgW6TkWCvHocnjLABb6LTKcFyKhMrOZT
 tckpAqMENwSYTDpc5ozIy9E8InwAWKM5r0b5jySXAp580usWPwlLpRoB5lp5ORdrUTs5SoO8C
 2WXhUErRq5in6kHKLNMxBR6nmURcSvz2lbWCiY2XPOLhNxCrmfa5l/4nGSAXcL+GBB930ykX/
 LNJ/ZkXJGaipo0qNOgEOsDvygqpH98Vfir/11dX3L08gznJjeCTgbv5zxKfmKp1cWW+C0tyHr
 xwwaPYuQ96rGGwaAH+SCCfYzlPxlovCNtG1oG4hDzx9EDaEEcS/95a/UQ0t2NpfW6rGrrPBnY
 kW9JwrlGgTLt5QCVpHuqEigF5bWRnkkzjS1jNDxRQO0vxmfF2fo3Fu/InT3UQMPutCH3IXwkb
 bECa3J42BH1i20tfJ4SjDve7B5Qzg5jTHNKq1z+w08xGNLfMirfJ+7x8h1kRSz9a4QrwxIUYZ
 qVuJaZDc6xn+6GREQyeBaTNIZVe1APaujbPlmISV7E4CYLL5s9JrMrhodKMxz8GPUfi6y42+b
 MrZySxoQ1av/EOOTrFc++QS+9aAqmnLQycQ1CazRqOW79alo5iZCnn/a+p1sLzxApTJVuKzoq
 nt71gCXNMMj6uhcE+BDJcz7HVhd75xlC8eqGFwdgU7KUa+x8yhx85MNie7XHrhzvuQ2zxk25e
 Wc56D8oeUMuy4oTLeBVx6IfxB555tqev+ZUjlVEFM26F2JXAeK8z4w+YrDbuYORrDNfcvvz8I
 8M8+M+xI/Cw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190511_075438_528944_A294C959 
X-CRM114-Status: GOOD (  17.51  )
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

SGkgZ3V5cywKCm9uIDUuMSsgdGhlIHN0b3J5IGtlZXBzIGJlaW5nIHRoZSBzYW1lLgoKOTUwIE1i
aXRzIGluIGVhY2ggZGlyZWN0aW9uLCBidXQgd2hlbiBpbiBkdXBsZXggUlggaXMgc3RhcnZpbmcg
dG8gfjcwCk1CaXRzLi4KCmV0aHRvb2wgLVMgZ2F2ZSBtZSBzb21lIGNvdW50cyBmb3IgbW1jX3J4
X2ZpZm9fb3ZlcmZsb3csIHdoaWNoIGkgZGlkbnQKcmVjb2duaXplIGJlZm9yZS4KCgpEbyB3ZSBo
YXZlIG5ldyBpZGVhcyAvIG5ldyBkaXJlY3Rpb24gdG8gZGlnIGZvciA/CgoKcmVnYXJkcywKU2lt
b24KCkFtIDAxLjAzLjIwMTkgdW0gMTA6MjMgc2NocmllYiBKb3NlIEFicmV1Ogo+IEhpIFNpbW9u
LAo+Cj4gT24gMi8yNy8yMDE5IDc6MDIgUE0sIFNpbW9uIEh1ZWxjayB3cm90ZToKPj4gSGksCj4+
Cj4+Cj4+IHRoZSB0aGluZyBpcyAsIHRoYXQgaW0gbm90IGEgc3RtbWFjIGRldmVsb3Blci4gWWVz
ICwgbWF5YmUgaSBjYW4gYmlzc2VjdAo+PiBpdCBhbmQgeWVzIHlvdSBhcmUgbHVja3kgc2luY2Ug
aW0gYSBDLWRldmVsb3BlciBzaW5jZSBhIGxvbmcgdGltZSBmb3IKPj4gZW1iZWRkZWQgc3lzdGVt
cy4KPj4KPj4gVGhlIHByb2JsZW0gaXMgdGhhdCBpIGRvbnQgdW5kZXJzdGFuZCB0aGUgc3RydWN0
dXJlIG9mIHN0bW1hYyBhbmQgaW0gbm90Cj4+IGF3YXJlIG9mIGFueSBkb2N1bWVudGF0aW9uIGFi
b3V0IHRoZSBkcml2ZXIgc3RydWN0dXJlIG5vciB0aGUgdW5kZXJseWluZwo+PiBldGhlcm5ldCBo
YXJkd2FyZSAoIGV2ZW4gdGhvdWdoIGltIHVzZWQgdG8gZXRoZXJuZXQgaGFyZHdhcmUgaW4gZW1i
ZWRkZWQKPj4gZW52aXJvbm1lbnQgKS4gU28gaG93IHNoYWxsIGkgcmVjb2duaXplIHRoZSByZWxl
dmFudCBjaGFuZ2UgYmV0d2Vlbgo+PiA0LjE0LjI5IGFuZCA1LjByYzggPwo+Pgo+Pgo+PiBJcyBp
dCBpbiB0aGUgRFRTL0RUQiwgd3JvbmcgaGFyZHdhcmUgZGVzY3JpcHRpb24gPyBJcyBpdCBpbiB0
aGUgY29kZSA/Cj4+IGhvdyBpcyB0aGUgZHVwbGV4IGhhcmR3YXJlIHdvcmtpbmcgb24gdGhpcyBw
aWVjZSA/Cj4+Cj4+IEkgY2FuIHRyeSB0byBzdXBwb3J0IHlvdSB0aGUgYmVzdCBpIGNhbiwgYnV0
IGkgaGF2ZSBsaXR0bGUgY2hhbmNlcyB0bwo+PiBhbmFseXplIGl0IG15c2VsZi4gQXQgd2hpY2gg
bWVhc3VyZW1lbnRzIC8gY291bnRlcnMgaXMgaXQgcG9zc2libGUgdG8KPj4gc2VlIHRoYXQgZHVw
bGV4IGlzIGZ1bGx5IHdvcmtpbmcgP8KgIFdoeSBkaWQgZXZlbiB0aGUgbm9uLWR1cGxleAo+PiBi
YW5kd2lkdGggcmVncmVzcyBmcm9tIDkwME1CaXRzIHRvIDY1MCA/IFdoeSBpcyB0aGF0IDY1MCBN
Qml0cyBkaXZpZGluZwo+PiB1cCB0byBUWCBhbmQgUlggaW4gc3VtbWFyeSB3aGVuIGRvaW5nIGR1
cGxleCA/IFdoeSBpcyBUWCBub3Qgc3RhcnZpbmcgaW4KPj4gZHVwbGV4IGJ1dCBSWCA/Cj4+Cj4+
IEZyb20gbXkgcG9pbnQgb2YgdmlldyBzaG91bGQgYmUgdGhlIGZvbGxvd2luZyB0aGluZ3MgZ2l2
ZW46Cj4+IC0gdGhlIG5vbiBkdXBsZXggYmFuZHdpZHRoIHNob3VsZCBiZSBzb21ld2hlcmUgYXJv
dW5kIDkwME1CaXRzICwgdGhlIEhXCj4+IGlzIGNhcGFibGUgb2YgdGhhdAo+PiAtIFRYIHNob3Vs
ZCBub3QgaW5mbHVlbmNlIFJYIG9yIHZpY2UgdmVyc2EgaW4gZHVwbGV4Cj4+IC0gdGhlIGR1cGxl
eCBiYW5kd2lkdGggc2hvdWxkIGJlIDkwME1CaXRzIGluIGJvdGggZGlyZWN0aW9ucyAoIG1heWJl
IGEKPj4gYml0IGFzeW1ldHJpYyB3aGVuIGJ1ZmZlcnMgaW4gYm90aCBkaXJzIGFyZSBub3Qgc2Ft
ZSApCj4+Cj4+IEkgZ3Vlc3Mgd2UgbmVlZCBzb21lIHByb2ZpbGluZyBvbiBzdG1tYWMgYW5kICgg
YXQgbGVhc3QgaSBuZWVkICkgbW9yZQo+PiBrbm93bGVkZ2Ugb2YgdGhlIGhhcmR3YXJlIGFuZCBz
dG1tYWMgaXRzZWxmLiBDYW4gc29tZW9uZSBwb2ludCBtZSB0byB0aGUKPj4gZHJpdmVyIGRvY3Vt
ZW50YXRpb24sIGRlc2NyaWJpbmcgdGhlIGZ1bmN0aW9ucyBpbiB0aGUgY29kZSBhbmQgdGhlCj4+
IHN0cnVjdHVyZSA/IEhvdyBjYW4gaSBwcm9maWxlIHN0bW1hYyAoIHVzdWFsbHkgaW0gdXNpbmcg
aGFyZHdhcmUgLyBKVEFHCj4+IGRlYnVnZ2VycyBhdCB3b3JrLCBidXQgaGVyZSBAaG9tZSBpIGdv
dCBub3RoaW5nIGxpa2UgdGhhdCApCj4+Cj4+IFNvIGhvdyBkbyB3ZSBjb250aW51ZSA/Cj4gV2hl
biBJIHNhaWQgYmlzc2VjdCBJIHdhcyBtZWFuaW5nIEdJVCBCaXNzZWN0IFsxXS4gWW91IHNob3Vs
ZG4ndAo+IG5lZWQgYW55IGRldmVsb3BtZW50IGJhY2tncm91bmQgZm9yIHRoaXMuIFlvdSBqdXN0
IGhhdmUgdG8gc3RhcnQKPiBiaXNzZWN0LCBjb21waWxlLCB0ZXN0IGFuZCBjaGVjayBpZiBjb21t
aXQgaXMgZ29vZCBvciBub3QuCj4KPiBJJ20gbm90IHZlcnkgZmFtaWxpYXIgd2l0aCB0aGlzIGZl
YXR1cmUgYnV0IEkgdGhpbmsgeW91IGNhbgo+IGJpc3NlY3QgcHJldHR5IGZhc3QgaWYgeW91IHNh
eSB5b3UganVzdCB3YW50IHN0bW1hYyBjb21taXRzLAo+IGNoZWNrICgiQ3V0dGluZyBkb3duIGJp
c2VjdGlvbiBieSBnaXZpbmcgbW9yZSBwYXJhbWV0ZXJzIHRvCj4gYmlzZWN0IHN0YXJ0Iikgb24g
cHJldmlvdXMgbGluayAuLi4gSW4geW91ciBjYXNlIGl0IHdvdWxkIGJlCj4gc3RtbWFjIGNoYW5n
ZXMsIGR0cywgYW5kIHBoeS4KPgo+IFsxXSBodHRwczovL2dpdC1zY20uY29tL2RvY3MvZ2l0LWJp
c2VjdAo+Cj4gVGhhbmtzLAo+IEpvc2UgTWlndWVsIEFicmV1CgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
