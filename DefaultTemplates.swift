//
//  DefaultTemplates.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

enum DefaultTemplates {
    static let offerLetter = """
Dear {{owner_name}},

I am interested in purchasing your property located at {{property_address}}. I am offering ${{offer_price}} for this land and can close quickly with no hassle on your end.

If you are interested, please sign and return the enclosed agreement.

Sincerely,
{{sender_name}}
"""

    static let purchaseAgreement = """
PURCHASE AND SALE AGREEMENT

This agreement is made between {{buyer_name}} and {{seller_name}} for the purchase of property located at {{property_address}} for the amount of ${{purchase_price}}.

Closing will occur within {{closing_days}} days.

Signatures:
Buyer: _____________________
Seller: _____________________
"""

    static let quitclaimDeed = """
QUITCLAIM DEED

For consideration of ${{amount}}, I, {{grantor_name}}, do hereby quitclaim to {{grantee_name}} the following property: {{property_description}}.

Executed this {{date}}.

________________________
{{grantor_name}}
"""

    static let neighborLetter = """
Hi Neighbor,

I noticed your property borders a parcel I currently own. I'm offering you the first opportunity to buy this land and expand your lot.

It's located at {{property_address}}. Let me know if you're interested!

Best,
{{sender_name}}
"""

    static let dueDiligenceChecklist = """
Due Diligence Items:
- Verify property access
- Check zoning and restrictions
- Confirm back taxes
- Assess terrain and usability
- Verify ownership records
"""
}
